

<#include "/include/head.ftl">
<!--[if IE 9]>         <html class="no-js lt-ie10"> <![endif]-->
<!--[if gt IE 9]><!-->
<html class="no-js">
  <!--<![endif]-->
  <head>
    <meta charset="UTF-8">
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">
    <title>订单管理  | 朴新教育</title>
    <link rel="shortcut icon" href="${ctxResource}/bootstrap/appui/img/favicon.png">
    <link rel="stylesheet" href="${ctxResource}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/plugins-2.6.css">
    <link rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/main-2.6.css">
    <link id="theme-link" rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/themes/social-2.4.css">
    <link rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/themes-2.2.css" id="theme-sign">
    <link rel="stylesheet" media="screen" href="${ctxResource}/bootstrap/px/js/validator/css/bootstrapValidator.css">
    <link rel="stylesheet" href="${ctxResource}/bootstrap/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="${ctxResource}/bootstrap/px/css/newDtGrid.css" />
    <link rel="stylesheet" type="text/css" href="${ctxResource}/bootstrap/px/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/style.css">
    <link rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/pages/billMgr_list.css">
    <!-- appui的 -->
    <script src="${ctxResource}/bootstrap/appui/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="${ctxResource}/bootstrap/appui/js/plugins/socket.io.js"></script>
    <script src="${ctxResource}/bootstrap/appui/js/vendor/jquery-2.2.0.min.js"></script>
    <script type="text/javascript" src="${ctxResource}/bootstrap/px/js/validator/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="${ctxResource}/bootstrap/px/js/bootstrap-select.min.js"></script>
  </head>
  <body>
    <div id="page-wrapper" class="page-loading">
      <!-- sidebar-visible-lg-mini设置页面左侧栏默认是收缩的 -->
      <div id="page-container" class="header-fixed-top sidebar-visible-lg-mini enable-cookies">
        <#include "/layout/left.ftl">
        <div id="main-container">
          <#include "/layout/top.ftl">
          <div id="page-content">
            <div class="content-header">
              <div class="row">
                <div class="col-sm-6">
                  <div class="header-section">
                    <h1>订单管理</h1>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="block">
              <div class="form-horizontal for-choose-horizontal">
                <div class="form-group">
                  <div class="col-md-2">
                    <select name="onlyClassRegion" id="onlyClassRegion" class="form-control">
                      <option value="" selected="selected">上课校区</option>
                      <#if schoolRegion?exists>
                      <#list schoolRegion?keys as key>
                      <option value="${key}">${schoolRegion[key]}</option>
                      </#list>
                      </#if>
                    </select>
                  </div>
                  <!-- 报名校区 -->
                  <div class="col-md-2">
                    <select name="schoolRegion" id="schoolRegion" class="form-control">
                    </select>
                  </div>
                  <div class="col-md-2">
                    <select name="class-region" id="class-region" class="form-control">
                      <option value="" selected="selected">是否包含上课校区</option>
                      <option value="1">是</option>
                      <option value="0">否</option>
                    </select>
                  </div>
                  <div class="col-md-2">
                    <select name="studentType" id="studentType" class="form-control">
                      <option value="" selected="selected">订单类型</option>
                      <option value="01">新签</option>
                      <option value="02">续费</option>
                    </select>
                  </div>
                  <div class="col-md-2">
                    <input class="form-control" id="billCode" type="text" placeholder="订单编码"/>
                  </div>
                  <div class="col-md-2">
                    <select name="claSemesterCode" id="claSemesterCode" class="form-control">
                      <option value="" selected="selected">学期</option>
                      <#if semesterList?exists>
                      <#list semesterList as semesterList>
                      <option value="${semesterList.code}">${semesterList.name}</option>
                      </#list>
                      </#if>
                      <select>
                      </div>
                    </div>
                    <div class="form-group">
                      <!-- 新增年级 by zhucaiyun 2017/07/30-->
                      <div class="col-md-2">
                        <select name="" id="gradeCode" class="form-control">
                          <option value="" selected="selected">年级</option>
                          <#if allGrade?exists>
                          <#list allGrade?keys as key>
                          <option value="${key}">${allGrade[key]}</option>
                          </#list>
                          </#if>
                        </select>
                      </div>
                      <div class="col-md-2">
                        <select name="isPay" id="isPay" class="form-control">
                          <option value="" selected="selected">支付状态</option>
                          <option value="01">是</option>
                          <option value="02">否</option>
                        </select>
                      </div>
                      <div class="col-md-2">
                        <select name="payType" id="payType" class="form-control selectpicker" multiple>
                          <option value="" selected="selected">支付方式</option>
                          <#if payMoneyType?exists>
                          <#list payMoneyType as key>
                          <option value="${key.code}">${key.name}</option>
                          </#list>
                          </#if>
                        </select>
                      </div>
                      <div class="col-md-2">
                        <select name="isDiscount" id="isDiscount" class="form-control">
                          <option value="" selected="selected">使用优惠</option>
                          <option value="01">是</option>
                          <option value="02">否</option>
                        </select>
                      </div>
                      <div class="col-md-2">
                        <select name="isDebt" id="isDebt" class="form-control">
                          <option value="" selected="selected">欠款状态</option>
                          <option value="01">是</option>
                          <option value="02">否</option>
                        </select>
                      </div>
                      <div class="col-md-2">
                        <select name="isRefee" id="isRefee" class="form-control">
                          <option value="" selected="selected">退费状态</option>
                          <option value="01">是</option>
                          <option value="02">否</option>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-2">
                        <select name="isEntoryClass" id="isEntoryClass" class="form-control">
                          <option value="" selected="selected">进班状态</option>
                          <option value="01">是</option>
                          <option value="02">否</option>
                        </select>
                      </div>
                      <div class="col-md-2">
                        <select name="isInsertClass" id="isInsertClass" class="form-control">
                          <option value="" selected="selected">插班状态</option>
                          <option value="01">是</option>
                          <option value="02">否</option>
                        </select>
                      </div>
                      <div class="col-md-2">
                        <select name="billStatus" id="billStatus" class="form-control">
                          <option value="" selected="selected">业绩状态</option>
                          <option value="1">已确认</option>
                          <option value="0">未确认</option>
                        </select>
                      </div>
                      <div class="col-md-2">
                        <select name="informationSource" id="informationSource" class="form-control">
                          <option value="" selected="selected">信息来源</option>
                        </select>
                      </div>
                      <div class="col-md-2">
                        <input class="form-control" id="createName" type="text" placeholder="报名员">
                      </div>
                      <div class="col-md-2">
                        <input class="form-control" id="billCreatorName" type="text" placeholder="咨询单创建人">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-2">
                        <input class="form-control" id="salesPartnerName" type="text" placeholder="销售合伙人">
                      </div>
                      <div class="col-md-2">
                        <input class="form-control" id="studentCodeOrName" type="text" placeholder="学员姓名/拼音">
                      </div>
                      <div class="col-md-2">
                        <input class="form-control" id="stuPhone" type="text" placeholder="学员电话">
                      </div>
                      <div class="col-md-2">
                        <select name="isVip" id="classModels" class="form-control selectpicker" multiple>
                          <option value="" selected="selected">班型</option>
                          <#if CM?exists>
                          <#list CM ? keys as key>
                          <option value="${key}">${CM[key]}</option>
                          </#list>
                          </#if>
                        </select>
                      </div>
                      <div class="col-md-4">
                        <div class="input-group input-daterange" data-date-format="yyyy-mm-dd">
                          <input type="text" id="start_time" class="form-control" name="beginDate" placeholder="报名时间范围开始">
                          <span class="input-group-addon"><i class="fa fa-chevron-right"></i></span>
                          <input type="text" id="end_time" class="form-control" name="endDate" placeholder="报名时间范围结束">
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-2">
                        <input class="form-control" id="classCodeOrName" type="text" placeholder="班级名称/编码">
                      </div>
                      <!-- 班级标签 -->
                      <div class="col-md-2">
                        <select name="classLabel" id="classLabel" class="form-control">
                          <option value="" selected="selected">班级标签</option>
                          <option value="bargain_class">特价班</option>
                          <option value="zero_class">0元班</option>
                          <option value="wait_sign_up">代报名</option>
                          <option value="rest_one">其他1</option>
                          <option value="rest_two">其他2</option>
                        </select>
                      </div>
                      <!-- 报名标签 -->
                      <div class="col-md-2">
                        <select name="billLabel" id="signLabel" class="form-control">
                          <option value="" selected="selected">报名标签</option>
                          <option value="specialClass">特价班</option>
                          <#if labels?exists>
                          <#list labels as label>
                          <option value="${label.id}">${label.name}</option>
                          </#list>
                          </#if>
                        </select>
                      </div>
                      <div class="col-md-2">
                        <input class="form-control" id="course" type="text" placeholder="课程">
                      </div>
                      <div class="col-md-2">
                        <select name="planYear" id="planYear" class="form-control">
                        </select>
                      </div>
                      <div class="col-md-2">
                        <select name="planAreaCode" id="planAreaCode" class="form-control">
                          <option value="" selected="selected">计划上课校区</option>
                          <#if schoolRegion?exists>
                          <#list schoolRegion?keys as key>
                          <option value="${key}">${schoolRegion[key]}</option>
                          </#list>
                          </#if>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-2">
                        <input class="form-control" id="contractNumberFilter" type="text" placeholder="合同编号">
                      </div>
                      <div class="col-md-2">
                        <!-- 添加发票状态 allInvoiceStatus-->
                        <select name="invoice" id="invoice" class="form-control">
                          <option value="">开票状态</option>
                          <#if allInvoiceStatus?exists>
                          <#list allInvoiceStatus?keys as key>
                          <option value="${key}">${allInvoiceStatus[key]}</option>
                          </#list>
                          </#if>
                        </select>
                      </div>
                      <div class="col-md-2">
                        <button type="button" id="searchAll" class="btn btn-primary btn-width-default">搜索</button>
                      </div>
                    </div>
                    <!-- 按钮列 -->
                    <div class="for-operate-wrap">
                      <@pxbutton code="update_student_type" styleClass="btn btn-info btn-sm goclasstime" onclick="changeStuType();" label="修改新签续费"> </@pxbutton>
                      <@pxbutton code="goclass" styleClass="btn btn-info btn-sm goclasstime" onclick="goclasstime();" label="修改进班日期"> </@pxbutton>
                      <button code="memo" class="btn btn-info btn-sm goclasstime" onclick="changeRemarks();">修改备注</button>
                      <button id="consumDetail" class="btn btn-primary btn-sm" onclick="goBillDetail();">查看课表课次消费信息</button>
                      <@pxbutton id="batchConfirmPerformance" code="batch_confirm_performance" styleClass="btn btn-primary btn-sm goclasstime" label="批量业绩确认"> </@pxbutton>
                      <@pxbutton id="confirmPrefor" code="bill_confirm" styleClass="btn btn-primary btn-sm goclasstime" onclick="confirmResult();" label="业绩确认"> </@pxbutton>
                      <@pxbutton id="quitePrefor" code="bill_cancel" styleClass="btn btn-warning btn-sm goclasstime" onclick="quiteResult();" label="取消业绩"> </@pxbutton>
                      <@pxbutton code="confirm_class" styleClass="btn btn-primary btn-sm goclasstime" onclick="confirmClass();" label="确认进班"> </@pxbutton>
                      <@pxbutton id="editSalerPartner" code="edit_Salers_Partner" styleClass="btn btn-primary btn-sm goclasstime" label="编辑销售合伙人" onclick="goEditSalerPartnerForm();"> </@pxbutton>
                      <@pxbutton id="contractNumber" code="contractNumber" styleClass="btn btn-warning btn-sm" onclick="operList.editContractNumber();" label="编辑合同编号"> </@pxbutton>
                      <@pxbutton id="batch_cancel_bill" code="batch_cancel_bill" styleClass="btn btn-warning btn-sm" onclick="operList.bulkCancelOrder();" label="批量取消订单"> </@pxbutton>
                      <!-- TODO 新增发票申请和取消发票申请的btn  -->
                      <button class="btn btn-success btn-sm" id="applyVoice" onclick="applyInvoice()">发票申请</button>
                      <button class="btn btn-info btn-sm" id="cancelVoiceApply" onclick="cancelApplyInvoice()">取消发票申请</button>
                    </div>
                  </div>
                  <!-- tab切换选项 -->
                  <ul id="myTab" class="nav nav-tabs">
                    <li class="active">
                      <a href="#classModeldcz1" data-num="1" data-toggle="tab">订单基本信息</a>
                    </li>
                    <li>
                      <a href="#classModeldcz2" data-num="2" data-toggle="tab">订单详细信息</a>
                    </li>
                    <li>
                      <a href="#classModeldcz3" data-num="3" data-toggle="tab">优惠信息</a>
                    </li>
                    <li>
                      <a href="#classModeldcz4" data-num="4" data-toggle="tab">付款记录</a>
                    </li>
                  </ul>
                  <!-- tab内容 -->
                  <div class="tab-content" id="myTabContent">
                    <!-- 订单基本信息 -->
                    <div class="tab-pane fade in active" id="classModeldcz1">
                      <div class="earn_quarter_baseinfo">
                        <div id="tb_main_body_baseinfo" class="dt-grid-container"></div>
                        <div id="tb_main_tool_baseinfo" class="dt-grid-toolbar-container"></div>
                      </div>
                      <div class="button-intro">
                        <label class="control-label">订单状态注释</label>
                        <span class="label label-primary ml35">进</span><span class="button-flow">已进班</span>
                        <span class="label label-info ml35">插</span><span class="button-flow">插班报名</span>
                        <span class="label label-danger ml35">欠</span><span class="button-flow">有欠款</span>
                        <span class="label label-warning ml35">惠</span><span class="button-flow">优惠报名</span>
                        <span class="label label-default ml35">退</span><span class="button-flow">已退费</span>
                      </div>
                    </div>
                    <!-- 订单详细信息 -->
                    <div class="tab-pane fade" id="classModeldcz2">
                      <div class="earn_quarter_detailsinfo">
                        <div id="tb_main_body_detailsinfo" class="dt-grid-container"></div>
                        <div id="tb_main_tool_detailsinfo" class="dt-grid-toolbar-container"></div>
                      </div>
                    </div>
                    <!-- 优惠信息 -->
                    <div class="tab-pane fade" id="classModeldcz3">
                      <div class="earn_quarter_cheapinfo">
                        <div id="tb_main_body_cheapinfo" class="dt-grid-container"></div>
                        <div id="tb_main_tool_cheapinfo" class="dt-grid-toolbar-container"></div>
                      </div>
                    </div>
                    <!-- 付款记录 -->
                    <div class="tab-pane fade" id="classModeldcz4">
                      <div class="earn_quarter_cheapinfo">
                        <div id="tb_main_body_history" class="dt-grid-container"></div>
                        <div id="tb_main_tool_history" class="dt-grid-toolbar-container"></div>
                      </div>
                    </div>
                  </div>
                  <!-- tab内容-end -->
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 批量业绩提示弹层 -->
        <div id="batchConfirm" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h5 class="modal-title"><strong>批量业绩确认</strong></h5>
              </div>
              <div class="modal-body">
                <div id="batchBusDiv" class="dt-grid-container">
                  <table class="performance-table" id="batchBusTab">
                    
                  </table>
                  <p>共<span id="recordNum"></span>条记录</p>
                  <p>订单的业绩全部归做报名员！确定批量业绩确认吗？</p>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="batchConfirmBtn">确认</button>
                <button type="button" class="btn btn-effect-ripple btn-danger" data-dismiss="modal">取消</button>
              </div>
            </div>
          </div>
        </div>
        
        <!-- 确认业务提示弹层 -->
        <div id="isConfirm" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        </div>
        <!-- 取消业务提示弹层 -->
        <div id="isCancel" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h5 class="modal-title"><strong>取消业绩</strong></h5>
              </div>
              <div class="modal-body">
                <div id="tb_main_body_histoty" class="dt-grid-container">确定取消业绩确认吗？</div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="cancelReport">确认</button>
                <button type="button" class="btn btn-effect-ripple btn-danger" data-dismiss="modal">关闭</button>
              </div>
            </div>
          </div>
        </div>
        <!-- 修改备注 -->
        <div id="alertRemarks" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h5 class="modal-title"><strong>修改备注</strong></h5>
              </div>
              <div class="modal-body">
                <div class="form-group" style="overflow:hidden">
                  <div class="col-xs-3 control-label"><label>备注</label></div>
                  <div class="col-xs-7"><textarea class="form-control" name="memo" id="updateRemarks"> </textarea></div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="confirmRemarks">确认</button>
                <button type="button" class="btn btn-effect-ripple btn-danger" data-dismiss="modal">关闭</button>
              </div>
            </div>
          </div>
        </div>
        <!-- 学员状态弹层 -->
        <div id="alertStuType" class="modal in" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h5 class="modal-title"><strong>修改订单类型</strong></h5>
              </div>
              <form id="gostuType" name="gostuType" method="post" action="">
                <div class="modal-body">
                  <div id="tb_main_body_histoty" class="dt-grid-container">
                    <select name="studentType" id="newStudentType" class="form-control">
                      <option value="" selected="selected">订单类型</option>
                      <option value="01">新签</option>
                      <option value="02">续费</option>
                    </select>
                  </div>
                </div>
              </form>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="confirmStuType">确认</button>
                <button type="button" class="btn btn-effect-ripple btn-danger" data-dismiss="modal">关闭</button>
              </div>
            </div>
          </div>
        </div>
        <!-- 进班时间修改弹窗 -->
        <div id="goclassDiv" class="modal in" tabindex="-1" role="dialog" aria-labelledby="myModalAlertLabel" aria-hidden="false">
          <div class="modal-dialog ">
            <div class="modal-content modal-content-px">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">修改进班时间</h4>
              </div>
              <form id='gotimer' name="gotimer" method="post" action="" >
                <div class="modal-body">
                  <div class="form-horizontal">
                    <div class="form-group" >
                      <div class="col-md-3 control-label"><label>进班时间</label></div>
                      <div class="col-md-6">
                        <input type="text" value="" class="form-control" id="edit_time" placeholder="选择时间" readonly>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" id="gosubmit">确认</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">取消</button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!-- 编辑销售合伙人 -->
        <div id="editPartnerDiv" class="modal in" tabindex="-1" role="dialog" aria-labelledby="myModalAlertLabel" aria-hidden="false">
          <div class="modal-dialog ">
            <div class="modal-content modal-content-px">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">编辑销售合伙人</h4>
              </div>
              <form id='gotimer' name="gotimer" method="post" action="" >
                <div class="modal-body">
                  <div class="form-horizontal">
                    <div class="form-group" >
                      <div class="col-md-3 control-label"><label>销售合伙人1</label></div>
                      <div class="col-md-3">
                        <input class="form-control input-typeahead" id="saleMen1" type="text" autocomplete="off">
                      </div>
                      
                      <div class="col-md-3 control-label"><label>销售合伙人2</label></div>
                      <div class="col-md-3">
                        <input class="form-control input-typeahead" id="saleMen2" type="text" autocomplete="off">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" id="goEditPartnerSubmit">确认</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">取消</button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!-- 确定取消订单弹窗 -->
        <div id="delDiv" class="modal in" tabindex="-1" role="dialog" aria-labelledby="myModalAlertLabel" aria-hidden="false">
          <div class="modal-dialog ">
            <div class="modal-content modal-content-px">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <div class="form-group">
                  <h4 class="modal-title col-md-2" id="modalTitle">取消订单</h4>
                  <p id="node" name="node" class="bigsize col-md-9" ></p>
                </div>
              </div>
              <form id='delForm' name="delForm" method="post" action="" >
                <div class="modal-body">
                  <div class="form-horizontal">
                    <div class="form-group" hidden="true">
                      <div class="col-md-3 control-label"><label>报名员</label></div>
                      <div class="col-md-3 col-md-offset-1 control-label" id="RA"></div>
                    </div>
                    <div class="form-group"  hidden="true">
                      <div class="col-md-3 control-label"><label>报名时间</label></div>
                      <div class="col-md-3 col-md-offset-1 control-label" id="L"></div>
                    </div>
                    <div class="form-group"  hidden="true">
                      <div class="col-md-3 control-label"><label>权限参数</label></div>
                      <div class="col-md-3 col-md-offset-1 control-label" id="buttonStatus"></div>
                    </div>
                    <div class="form-group"  hidden="true">
                      <div class="col-md-3 control-label"><label>订单编号</label></div>
                      <div class="col-md-3 col-md-offset-1 control-label" id="A"></div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-2 control-label"><label>学员姓名</label></div>
                      <div class="col-md-2  control-label" id="StuN"></div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-2 control-label"><label>班级名称</label></div>
                      <div class="col-md-4  control-label" id="C_N"></div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-2 control-label"><label>退款金额</label></div>
                      <div class="col-md-2 control-label" id="PM"></div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-2  control-label"><label><i>*</i>备注</label></div>
                      <div class="col-md-10">
                        <textarea name="name" id="memo" class="form-control" size="30" ></textarea>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" class="btn btn-primary" >确认</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">取消</button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!-- 确定批量取消订单 -->
        <div id="bulkDelDiv" class="modal in" tabindex="-1" role="dialog" aria-labelledby="myModalAlertLabel" aria-hidden="false">
          <div class="modal-dialog ">
            <div class="modal-content modal-content-px">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <div class="form-group">
                  <h4 class="modal-title">取消订单</h4>
                  <p id="node" name="node" class="bigsize col-md-9" ></p>
                </div>
              </div>
              <div class="modal-body">
                <div class="text-center">确定批量取消订单？</div>
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary" id="bulkCancelBtn">确认</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">取消</button>
              </div>
            </div>
          </div>
        </div>
        <!-- 取消订单时确认是否 已开票了 -->
        <div id="billInvoiceModal" class="modal in" tabindex="-1" role="dialog" aria-labelledby="myModalAlertLabel" aria-hidden="false">
          <div class="modal-dialog ">
            <div class="modal-content modal-content-px">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <div class="form-group">
                  <h4 class="modal-title">取消订单</h4>
                </div>
              </div>
              <div class="modal-body">
                <div class="text-center" id="billInvoiceCon"></div>
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary" id="confirmIsReturn">我确认发票已退回</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">发票尚未退回</button>
              </div>
            </div>
          </div>
        </div>
        <!-- 预览价格方案 -->
        <div id="add-scheme" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h5 class="modal-title"><strong>价格方案</strong></h5>
              </div>
              <div class="modal-body">
                <div class="form-group clearfix">
                  <label class="col-md-3" id="scheme-name">方案名称</label>
                  <label class="col-md-3" id="version-name">方案名称</label>
                </div>
                <div class="table-wrap">
                  <table class="table table-striped table-bordered table-vcenter text-center" id="table-scheme">
                  </table>
                </div>
                <label class="control-label font-16">应用范围</label>
                <ul class="select-course-body" id="select-course-body">
                </ul>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-effect-ripple btn-primary" data-dismiss="modal" aria-hidden="true"> 确定 </button>
              </div>
            </div>
          </div>
        </div>
        <!-- 编辑合同编码 -->
        <div id="editContractNumberModal" class="modal in" tabindex="-1" role="dialog" aria-labelledby="myModalAlertLabel" aria-hidden="false">
          <div class="modal-dialog ">
            <div class="modal-content modal-content-px">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">编辑合同编码</h4>
              </div>
              <form id='gotimer' name="gotimer" method="post" action="" >
                <div class="modal-body">
                  <div class="form-horizontal">
                    <div class="form-group" >
                      <div class="col-md-3 control-label"><label>合同编码</label></div>
                      <div class="col-md-6">
                        <input class="form-control" id="contractNumberInput" type="text">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" id="confirmEditContractNumber" onclick="operList.confirmEditContractNumber()">确认</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">取消</button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!-- 弹层end -->
        <!-- 查看 发票详情 取消发票申请公用同一个弹层 -->
        <div id="invoiceDetailModal" class="modal in" tabindex="-1" role="dialog" aria-labelledby="myModalAlertLabel" aria-hidden="false">
          <div class="modal-dialog">
            <div class="modal-content modal-content-px">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="invoiceTit">发票详情</h4>
              </div>
              <div class="modal-body">
                <div class="form-horizontal">
                  <table class="table table-striped table-borderless table-vcenter">
                    <thead>
                      <tr>
                        <th>订单编号</th>
                        <th class="hidden-xs">班级编码</th>
                        <th class="hidden-sm hidden-xs">实付金额</th>
                      </tr>
                    </thead>
                    <tbody id="invoiceBillInfo">

                    </tbody>
                  </table>
                  <div class="form-group borderB">
                    <div class="col-md-12">
                      <label class="control-label">发票金额：</label>
                      <span id="getInvoiceMoney"></span>
                    </div>
                  </div>

                  <div class="form-group borderB">
                    <div class="col-md-6 ">
                      <label class="control-label">发票类型：</label>
                      <span id="invoType"></span>
                    </div>
                    <!-- 普通发票 单位 -->
                    <div class="col-md-6 nor-com">
                      <label class="control-label">单位名称：</label>
                      <span id="norComName"></span>
                    </div>
                    <div class="col-md-6 nor-com">
                      <label class="control-label">税号：</label>
                      <span id="norComCode"></span>
                    </div>

                    <!-- 普通发票 个人 -->
                    <div class="col-md-6 nor-per">
                      <label class="control-label">发票抬头：</label>
                      <span id="norPerName"></span>
                    </div>

                    <!-- 专用发票 -->
                    <div class="col-md-6 pro-per">
                      <label class="control-label">单位名称：</label>
                      <span id="proName"></span>
                    </div>
                    <div class="col-md-6 pro-per">
                      <label class="control-label">税号：</label>
                      <span id="proInvCode"></span>
                    </div>
                    <div class="col-md-6 pro-per">
                      <label class="control-label">开户行：</label>
                      <span id="proBank"></span>
                    </div>
                    <div class="col-md-6 pro-per">
                      <label class="control-label">账号：</label>
                      <span id="proAccount"></span>
                    </div>
                    <div class="col-md-6 pro-per">
                      <label class="control-label">地址：</label>
                      <span id="proAdd"></span>
                    </div>
                    <div class="col-md-6 pro-per">
                      <label class="control-label">电话：</label>
                      <span id="proPhone"></span>
                    </div>
                  </div>

                  <div class="form-group  borderB">
                    <div class="col-md-12 ">
                      <label class="control-label">备注：</label>
                      <span id="invoiceMemo"></span>
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="col-md-12">
                      <label class="control-label">开票状态：</label>
                      <span id="invoiceStatusName"></span>
                    </div>
                  </div>
                  <div class="form-group invoice-history">

                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="cancelApplyInvoice">取消发票申请</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">取消</button>
              </div>
            </div>
          </div>
        </div>
        <!-- 弹层结束 -->

        <!-- 申请发票 弹层 -->
        <div id="applyInvoiceModal" class="modal in" tabindex="-1" role="dialog" aria-labelledby="myModalAlertLabel" aria-hidden="false">
          <div class="modal-dialog">
            <div class="modal-content modal-content-px">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">发票申请</h4>
              </div>
              <div class="modal-body">
                <form class="form-horizontal" id="applyInfoForm">
                  <table class="table table-striped table-borderless table-vcenter">
                    <thead>
                      <tr>
                        <th>订单编号</th>
                        <th class="hidden-xs">班级编码</th>
                        <th class="hidden-sm hidden-xs">实付金额</th>
                      </tr>
                    </thead>
                    <tbody id="invoiceApplyBillInfo">

                    </tbody>
                  </table>
                  <div class="form-group pb-15">
                    <div class="col-md-3 ">
                      <label class="control-label"><span class="text-danger">*</span>发票金额：</label>
                    </div>
                    <div class="col-md-3">
                      <input type="text" class="form-control" id="invoiceNum" dataNum = "">
                    </div>
                  </div>

                  
                    <div class="block-title">
                      <ul class="nav nav-tabs" data-toggle="tabs">
                        <li id="normalLi" class="active"><a href="#VATNormalIn">增值税普通发票</a></li>
                        <li id="profesLi"><a href="#VATProfIn">增值税专用发票</a></li>
                      </ul>
                    </div>
                    <div class="tab-content">
                      <div class="tab-pane active" id="VATNormalIn">
                        <div class="form-group">
                          <div class="col-md-12">
                            <label class="radio-inline" for="personal">
                              <input type="radio" id="personal" value="1" name="applyRole" autocomplete="off"> 个人
                            </label>
                            <label class="radio-inline" for="company">
                              <input type="radio" id="company" value="2" name="applyRole" autocomplete="off"> 单位
                            </label> 
                          </div>
                        </div>
                       <div class="form-group  borderB">
                         <div class="col-md-6 personalCon">
                            <label class="control-label">发票抬头：</label>
                            <span id="inPenName">朱彩云</span>
                          </div>
                          <div class="col-md-6 companyCon">
                            <input type="text" id="compName" class="form-control" placeholder="单位名称">
                          </div>
                          <div class="col-md-6 companyCon">
                            <input type="text" id="inCode" class="form-control" placeholder="税号">
                          </div>
                       </div>
                      </div>

                      <div class="tab-pane" id="VATProfIn">
                        <div class="form-group  borderB">
                          <div class="col-md-6">
                            <input type="text" id="pCompName" class="form-control" placeholder="单位全称">
                          </div>
                          <div class="col-md-6">
                            <input type="text" id="pCompInNum" class="form-control" placeholder="税号">
                          </div>
                          <div class="col-md-6">
                            <input type="text" id="pBankName" class="form-control" placeholder="开户行">
                          </div>
                          <div class="col-md-6">
                            <input type="text" id="pBankAccount" class="form-control" placeholder="账号">
                          </div>
                          <div class="col-md-6">
                            <input type="text" id="pCompAdd" class="form-control" placeholder="地址">
                          </div>
                          <div class="col-md-6">
                            <input type="text" id="pComPhone" class="form-control" placeholder="电话">
                          </div>
                        </div>
                      </div>
                    </div>

                  <div class="form-group borderB">
                    <div class="col-md-3">
                      <label class="">备注：</label>
                    </div>
                    <div class="col-md-9">
                      <textarea id = "memoApplyInfo" class="form-control" placeholder="最多只能输入50个字"></textarea>
                    </div>
                  </div>
                </form>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="confirmApplyInvoice">提交申请</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">取消</button>
              </div>
            </div>
          </div>
        </div>
        <!-- 申请发票 end -->
        <script src="${ctxResource}/bootstrap/js/bootstrap.min.js"></script>
        <script src="${ctxResource}/bootstrap/appui/js/plugins-2.6.js"></script>
        <script src="${ctxResource}/bootstrap/appui/js/app-2.4.js"></script>
        <!-- dtGrid -->
        <script type="text/javascript" src="${ctxResource}/bootstrap/px/js/jquery.dtGrid.js"></script>
        <script type="text/javascript" src="${ctxResource}/bootstrap/px/js/lang/zh-cn.js"></script>
        <script type="text/javascript" src="${ctxResource}/bootstrap/js/bootstrap-datetimepicker.js"></script>
        <script type="text/javascript" src="${ctxResource}/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
        <script src="${ctxResource}/bootstrap/appui/js/publicUse.js"></script>
        <script type="text/javascript">
        var globalCurrentNum = 1;
        var initPageSize = 10;
        if (window.localStorage) {
          initPageSize = localStorage.getItem("dt_billMgrList_pagesize") || initPageSize;
        }
        $("#edit_time").datetimepicker({
          language: 'zh-CN',
          format: "yyyy-mm-dd hh:ii",
          autoclose: true,
          todayBtn: true,
          minView: 0,
          pickerPosition: "bottom-left"
        });

        $('.datetimepicker').hide();
        $('#start_time,#end_time').val(getFomatDate('ymd', '-'));

        $(function() {
          var PublicObj = {
            init: function() {
              var that = this;
              $('#planYear').html(that.getYear());
              // 报名校区下拉
              getArea("schoolRegion", "报名校区");

              DetailBaseInfo.initTable();
              $('.selectpicker').selectpicker({
                'selectedText': 'cat'
              });
              $('#myTab a:first').tab('show');
              $('#myTab a').click(function(e) {
                e.preventDefault(); //阻止a链接跳转
                var currentNum = $(this).data('num');
                globalCurrentNum = $(this).data('num');
                if (globalCurrentNum == 2) {
                  $(".for-operate-wrap").show();
                } else {
                  $(".for-operate-wrap").hide();
                }
                if (!$('#classModeldcz' + currentNum).hasClass('active')) {
                  $('#classModeldcz' + currentNum).addClass('in').addClass('active').siblings().removeClass('in').removeClass('active')
                }
                if (globalCurrentNum == 2) {
                  operList.initFunc();
                } else if (globalCurrentNum == 3) {
                  cheapDetailInfo.initFunc();
                } else if (globalCurrentNum == 4) {
                  historyPay.initFunc();
                }
              });
              $('#searchAll').on('click', function() {
                var grid_data;
                switch (globalCurrentNum) {
                  case 1:
                    // DetailBaseInfo.search();
                    grid_data = grid_baseinfo;
                    break;
                  case 2:
                    grid_data = grid_detailsinfo;
                    break;
                  case 3:
                    grid_data = grid_cheapinfo;
                    break;
                  case 4:
                    grid_data = grid_history;
                    break;
                  default:
                    break;
                }
                grid_data.diyparameters = getObjDtgrid();
                grid_data.refresh(true);
              });
              //表单校验
              $('#delForm').bootstrapValidator({
                feedbackIcons: {
                  valid: 'glyphicon glyphicon-ok',
                  invalid: 'glyphicon glyphicon-remove',
                  validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                  name: {
                    message: '备注必须填写！',
                    validators: {
                      notEmpty: {
                        message: '备注必须填写！'
                      },
                      regexp: {
                        regexp: /^.{5,}$/,
                        message: '备注信息必须大于5个字！'
                      }
                    }
                  },
                  memotest: {
                    message: '备注必须填写！',
                    validators: {
                      notEmpty: {
                        message: '备注必须填写！'
                      }
                    }
                  }
                }
              }).on('success.form.bv', function(e) {
                e.preventDefault();
                var $form = $(e.target);
                var bv = $form.data('bootstrapValidator')
                var payMoney = $('#PM').html().replace(/,/g, '');
                var memo = $('#memo').val();
                var studentRegisterCode = $('#A').html();
                // console.log(studentRegisterCode + "---" + payMoney + "***" + memo);
                $.ajax({
                  type: "POST",
                  url: '${ctx}/billMgr/billMgrCtrl/cancelBill.do',
                  data: {
                    "studentRegisterCode": studentRegisterCode,
                    "memo": memo,
                    "payMoney": payMoney
                  },
                  dataType: "json",
                  success: function(msg) {
                    if (msg.result == "1") {
                      showAlertInfo("success", msg.message);
                    } else {
                      showAlertInfo("error", msg.message);
                    }
                    $('#delDiv').modal('hide');
                    DetailBaseInfo.reload();
                  }
                })
              });
            },
            // 获取将来5年
            getYear: function() {
              var str = '',
                i = 0,
                year = new Date().getFullYear(),
                len = 5;
              str += '<option value="">计划上课年度</option>';
              for (; i < len; i++) {
                str += '<option value="' + year + '">' + year + '年</option>';
                year++;
              }
              return str;
            }
          }
          PublicObj.init();
        });
        var DetailBaseInfo = {
          grid_baseinfo: "",
          path: function() {
            return getProjectPath()
          },
          //初始化表格数据
          initTable: function() {
            var tables = {};
            var that = this;
            //定义表格列属性
            tables.dtGridColumns = [{
              id: 'A',
              title: '订单编码',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'R_N',
              title: '收据号',
              type: 'string',
              columnClass: 'text-center',
              hide: true
            }, {
              id: 'status',
              title: '订单状态',
              type: 'string',
              columnClass: 'text-left',
              resolution: function(value, record, column, grid, dataNo, columnNo) {
                var content = '';
                var am = record.AM && record.AM.replace(/,/g, '') || 0;
                if (record.U == "√") { //进
                  content += '<span class="label label-primary m15" style="margin:0 5px;">进</span>';
                }
                if (record.D == "√") { //插
                  content += '<span class="label label-info m15" style="margin:0 5px;">插</span>';
                }
                if (+am > 0) { //欠
                  content += '<span class="label label-danger m15" style="margin:0 5px;">欠</span>';
                }
                if (+(record.MB && record.MB.replace(/,/g, '')) > 0) { //惠
                  content += '<span class="label label-warning m15" style="margin:0 5px;">惠</span>';
                }
                if (record.T == "√") { //退
                  content += '<span class="label label-default m15" style="margin:0 5px;">退</span>';
                }
                return content;
              }
            }, {
              id: 'SN',
              title: '学员编码',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'StuN',
              title: '学员姓名',
              type: 'string',
              columnClass: 'text-center',
              resolution: function(value, record, column, grid, dataNo, columnNo) {
                var content = '';
                content += '<a onclick=getStudentName("' + record.StuN + '"); style="text-decoration:none;color:#0C87D5; cursor:pointer;">' + record.StuN + '</a>';
                return content;
              }
            }, {
              id: 'RN',
              title: '订单类型',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'C_N',
              title: '班级名称',
              type: 'string',
              columnClass: 'text-center',
              resolution: function(value, record, column, grid, dataNo, columnNo) {
                var content = '';
                content += '<a onclick=getClassName("' + record.CA + '"); style="text-decoration:none;color:#0C87D5; cursor:pointer;">' + record.C_N + '</a>';
                return content;
              }
            }, {
              id: 'IV',
              title: '班级是否一对一',
              type: 'string',
              columnClass: 'text-center',
              hide: true
            }, {
              id: 'U',
              title: '已进班级',
              type: 'string',
              columnClass: 'text-center',
              hide: true
            }, {
              id: 'CMN',
              title: '班型',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'L',
              title: '报名时间',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'MA',
              title: '课程价格',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'X_B',
              title: '服务费',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'X_D',
              title: '优惠后金额',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'PM',
              title: '已付款',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'MB',
              title: '优惠',
              type: 'string',
              columnClass: 'text-center',
              hide: true
            }, {
              id: 'AM',
              title: '欠款',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'Y',
              title: '报名校区',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'RA',
              title: '报名员',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'D',
              title: '插班',
              type: 'string',
              columnClass: 'text-center',
              hide: true
            }, {
              id: 'T',
              title: '退课时',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'CA',
              title: '班级编码',
              type: 'string',
              columnClass: 'text-center',
              hide: true
            }, {
              id: 'buttonStatus',
              title: '权限管理',
              type: 'string',
              columnClass: 'text-center',
              hide: true
            }, {
              id: 'oper',
              title: '操作',
              type: 'string',
              columnClass: 'text-center',
              resolution: function(value, record, column, grid, dataNo, columnNo) {
                var content = '',
                  studentRegisterCode = record.A, //参数传递record.A-订单编码
                  isEntryClass = record.U,
                  debt = record.AM && record.AM.replace(/,/g, '') || 0,
                  payMoney = record.PM && record.PM.replace(/,/g, '') || 0,
                  turn = record.T || 0; // 是否已退费
                nowTimes = record.L && record.L.replace(/\/|-/g, "") || 0,
                  today = getFomatDate('ymd', ''),
                  nowTimes = nowTimes === today;

                if (debt > 0) { //欠款
                  // 已经含退的订单，不可以再进行缴费。
                  if (turn !== "√") {
                    if (record.productBagSign == "1") {
                      content += '<button class="btn btn-xs btn-primary" onclick="goProductBag(\'' + studentRegisterCode + '\')">缴费</button>';
                    } else {
                      // 班级是一对一
                      if (record.IV === '√') {
                        content += '<button class="btn btn-xs btn-primary" onclick="forwordssPay(\'' + studentRegisterCode + '\')">缴费</button>';
                      } else {
                        content += '<button class="btn btn-xs btn-primary" onclick="classStudentPayT(\'' + studentRegisterCode + '\')">缴费</button>';
                      }
                    }
                  }
                } else { //不欠款
                  content += '<button class="btn btn-xs btn-default" disabled>缴费</button>';
                }
                if (payMoney > 0 || turn == "√") { //已付款或者已退费
                  content += '<button class="btn btn-xs btn-default" disabled>删除</button>';
                } else { //未付款
                  content += '<button class="btn btn-xs btn-primary" onclick="forwordssDel(\'' + studentRegisterCode + '\')">删除</button>';
                }
                /*
                 *取消订单逻辑归纳：
                 * 在收款审核中已经确认收款的不能进行取消订单操作； 参数是：audiStatus("确认收款的是"1；"未确认收款/取消审核的是":0)by zhucaiyun 2017/02/04
                 * 在无权限的情况下：只有本人生成的今天的订单可以取消
                 * 有权限的情况下：都可以取消订单
                 * 权限管理(0:无权限 1:有权限);今天生成的;本人生成的订单
                 * T:退课时 PM:已付款  U:已进班级  buttonStatus:权限管理  RA:报名员
                 * T：是否退费，已退费： '√'  或 未退费：  空串
                 * PM: 订单实付金额，
                 * U：是否进班，已进班： '√'  或 未进班：空串
                 * buttonStatus：按钮权限，有权限："1" 或 没有权限: "0"
                 *
                 * 1、已退费的订单或者是订单是否金额为0的订单或者是 未进班的订单不能取消订单操作；
                 * 2、满足以上要求的订单，操作者必须满足：
                 * a、有按钮权限，订单是今日的订单且订单的操作者是本账户的可以进行取消订单，否则不能取消订单
                 * b、如果订单和操作员都满足则还需要判断订单是否是已经确认收款且未取消审核的订单，如果是则不能进行取消订单操作，并且给提示
                 */

                // 对订单进行判断（已退费的订单或者是订单是否金额为0的订单或者是 未进班的订单不能取消订单操作）
                if (record.T == "√" || (record.PM == 0) && ("" == isEntryClass)) {
                  content += '<button type="button" class="btn btn-xs btn-default" disabled>取消订单</button>'
                } else {
                  // 对操作员判断 （有按钮权限，订单是今日的订单且订单的操作者是本账户的可以进行取消订单，否则不能取消订单）
                  if (record.buttonStatus == 0 && (!nowTimes || record.RA !== "<#if Session.PXJY_LOGIN_USER??><#if Session.PXJY_LOGIN_USER.name??>${Session.PXJY_LOGIN_USER.name}</#if></#if>")) {
                    content += '<button class="btn btn-xs btn-default" disabled>取消订单</button>'
                      // 收款审核的订单操作（如果订单和操作员都满足则还需要判断订单是否是已经确认收款且未取消审核的订单，如果是则不能进行取消订单操作，并且给提示）
                  } else if (record.auditStatus === "1") {
                    content += '<button type="button" class="btn btn-xs btn-primary paid-money">取消订单</button>'
                  } else {
                    content += '<button class="btn btn-xs btn-primary" onclick="todel(\'' + record.RA + '\',\'' + record.L + '\',\'' + record.A + '\',\'' + record.StuN + '\',\'' + record.C_N + '\',\'' + record.PM + '\',\'' + record.buttonStatus + '\',\'' + record.invoiceStatus + '\')">取消订单</button>';
                  }
                }
                content = '<div class="operWidth">' + content + '</div>';
                return content;
              }
            }];
            //定义表格
            tables.dtGridOption = {
              lang: 'zh-cn',
              freezecol: '',
              freezerow: '',
              ajaxLoad: true,
              loadURL: '${ctx}/billMgr/billMgrCtrl/newQueryByPage.do',
              exportFileName: '订单基本信息',
              columns: tables.dtGridColumns,
              // totalCountCol: [14, 15],
              totalCountColById: ['X_D', 'PM'],
              gridContainer: 'tb_main_body_baseinfo',
              toolbarContainer: 'tb_main_tool_baseinfo',
              tools: 'refresh|faseQuery|export[excel,pdf,]|print',
              pageSize: initPageSize,
              pageSizeLocal: 'true',
              pageSizeName: 'dt_billMgrList_pagesize',
              pageSizeLimit: [10, 20, 50, 100, 500],
            };
            grid_baseinfo = $.fn.DtGrid.init(tables.dtGridOption);
            grid_baseinfo.diyparameters = getObjDtgrid();
            grid_baseinfo.load();
          },
          getCheckList: function() {
            return grid_baseinfo.getCheckedRecords();
          },
          reload: function() {
            grid_baseinfo.refresh(true);
          },
          search_stuN: function(data) {
            grid_baseinfo.diyparameters = new Object();
            grid_baseinfo.diyparameters['studentName'] = data; //报名学员
            grid_baseinfo.diyparameters['studentCode'] = data;
            grid_baseinfo.refresh(true);
          },
          search_classN: function(ele) {
            grid_baseinfo.diyparameters = new Object();
            grid_baseinfo.diyparameters['classCode'] = ele; //班级
            grid_baseinfo.diyparameters['className'] = ele; //班级
            grid_baseinfo.refresh(true);
          }
        };
        /*订单详细信息*/
        $(function() {
          // operList.initTable();
          // 信息来源获取选项信息
          $.ajax({
            type: "POST",
            url: "${ctx}/billMgr/billMgrCtrl/getSchoolChannel.do",
            dataType: "json",
            async: false,
            success: function(msg) {
              var oSelect = $('#informationSource');
              if (msg.length > 0) {
                for (var i = 0; i < msg.length; i++) {
                  $("<option value='" + msg[i].Name + "'>" + msg[i].Name + "</option>").appendTo(oSelect);
                }
              }
            }
          });
        });
        // 订单详情
        var operList = {
          grid_detailsinfo: "",
          path: function() {
            return getProjectPath()
          },
          isInit: 0,
          initFunc: function() {
            if (operList.isInit === 0) {
              $("#tb_main_body_detailsinfo").html("");
              $("#tb_main_tool_detailsinfo").html("");
              operList.initTable();
            }
          },
          //初始化表格数据
          initTable: function() {
            operList.isInit = 1;
            var detailsinfo_tables = {};
            var that = this;
            //定义表格列属性
            detailsinfo_tables.dtGridColumns = [{
                id: 'A',
                title: '订单编码',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'StuN',
                title: '学员姓名',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'SN',
                title: '学员编码',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'PH',
                title: '学员电话',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'R_N',
                title: '收据单号',
                type: 'string',
                columnClass: 'text-center',
                hide: true,
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'C_T',
                title: '报名时间',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'enterClassTime',
                title: '进班时间',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'confirmEnterclassTime',
                title: '确认进班时间',
                type: 'string',
                columnClass: 'text-center'
              }, {
                id: 'classBeginDate',
                title: '订单开课日期',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'classEndDate',
                title: '订单结课日期',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'bindingDesc',
                title: '是否绑定APP',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'informationSource',
                title: '信息来源',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'RA',
                title: '报名员',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'RNumber',
                title: '成单数占比',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq',
                columnStyle: 'color:#de4b39;',
                headerStyle: 'color:#de4b39;'
              }, {
                id: 'RMoney',
                title: '成单金额占比',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq',
                columnStyle: 'color:#de4b39;',
                headerStyle: 'color:#de4b39;'
              }, {
                id: 'billCreatorName',
                title: '咨询单创建人',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'salesPartnerAName',
                title: '销售合伙人1',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'SNOne',
                title: '成单数占比',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq',
                columnStyle: 'color:#de4b39;',
                headerStyle: 'color:#de4b39;'
              }, {
                id: 'SMOne',
                title: '成单金额占比',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq',
                columnStyle: 'color:#de4b39;',
                headerStyle: 'color:#de4b39;'
              }, {
                id: 'salesPartnerBName',
                title: '销售合伙人2',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'SNTwo',
                title: '成单数占比',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq',
                columnStyle: 'color:#de4b39;',
                headerStyle: 'color:#de4b39;'
              }, {
                id: 'SMTwo',
                title: '成单金额占比',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq',
                columnStyle: 'color:#de4b39;',
                headerStyle: 'color:#de4b39;'
              }, {
                id: 'refereeAName',
                title: '推荐人1',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'refereeBName',
                title: '推荐人2',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'RN',
                title: '订单类型',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'deptName',
                title: '部门',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'teachingItemName',
                title: '项目',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'PB',
                title: '课程',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'billLabel',
                title: '报名标签',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'classLabel',
                title: '班级标签',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: '_CList',
                title: '课程单元（课时）',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'CH_A',
                title: '总课时',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'CH_H',
                title: '总小时',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'purchaseHours',
                title: '购买课时',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'freeHours',
                title: '赠送课时',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'addHours',
                title: '加赠课时',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'goclasstimer',
                title: '价格方案',
                type: 'string',
                columnClass: 'text-center',
                resolution: function(value, record, column, grid, dataNo, columnNo) {
                  var content = '';
                  if (record.IV === '√') {
                    if (record.pricePlanSetId !== undefined) {
                      content = '<a onclick="operList.skanPricePlan(' + record.pricePlanSetId + ')">' + record.pricePlanSetName + '</a>';
                    }
                  }
                  return content;
                }
              }, {
                id: 'CA',
                title: '班级编码',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'C_N',
                title: '班级名称',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'gradeName',
                title: '班级年级',
                type: 'string',
                columnClass: 'text-center'
              }, {
                id: 'subjectName',
                title: '班级科目',
                type: 'string',
                columnClass: 'text-center'
              }, {
                id: 'quarterName',
                title: '学期',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'servicefeeName',
                title: '服务费名称',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'MA',
                title: '课程价格',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'MC',
                title: '优惠后价格',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'PM',
                title: '已付款',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'AM',
                title: '欠款',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'D',
                title: '是否插班',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'U',
                title: '进班状态',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'CH_C',
                title: '消费课时',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'C_X',
                title: '剩余课时',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'C_L',
                title: '消费余额',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'T',
                title: '已退课时',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'TD',
                title: '退费日期',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'MN',
                title: '退费金额',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'readingSchool',
                title: '在读学校',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'Y',
                title: '报名校区',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'C_AR_N',
                title: '上课校区',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'contractNumber',
                title: '合同编号',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'productBagName',
                title: '所属产品包',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'billStatusName',
                title: '业绩状态',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'M_C',
                title: '备注',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'IV',
                title: '是否一对一',
                type: 'string',
                columnClass: 'text-center',
                hide: true,
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'pricePlanSetId',
                title: '方案id',
                type: 'string',
                columnClass: 'text-center',
                hide: true,
                fastQuery: true,
                fastQueryType: 'eq'
              },
              // 新增两列  开票状态，发票详情
              {
                id: 'invoiceStatusName',
                title: '开票状态',
                type: 'string',
                columnClass: 'text-center',
                fastQuery: true,
                fastQueryType: 'eq'
              }, {
                id: 'invoiceStatus',
                title: '发票详情',
                type: 'string',
                columnClass: 'text-center',
                resolution: function(value, record, column, grid, dataNo, columnNo) {
                  var content = '';
                  if (value != "1") {
                    content += '<button class="btn-primary btn-xs" onclick="getDetailInvoice(\'' + record.invoiceCode + '\')">查看</button>'
                  }
                  return content;
                }
              }
            ];
            //定义表格
            detailsinfo_tables.dtGridOption = {
              lang: 'zh-cn',
              freezecol: 4,
              freezerow: 0,
              ajaxLoad: true,
              check: true,
              // totalCountCol: [37, 45, 46, 47, 52, 56],
              totalCountColById: ['addHours', 'MA', 'MC', 'PM', 'C_X', 'MN'],
              loadURL: '${ctx}/billMgr/billMgrCtrl/newQueryByPage.do',
              exportFileName: '订单详细信息',
              columns: detailsinfo_tables.dtGridColumns,
              gridContainer: 'tb_main_body_detailsinfo',
              toolbarContainer: 'tb_main_tool_detailsinfo',
              tools: 'refresh|faseQuery|export[excel,pdf,]|print',
              pageSize: initPageSize,
              pageSizeLocal: 'true',
              pageSizeName: 'dt_billMgrList_pagesize',
              pageSizeLimit: [10, 20, 50, 100, 500]
            };
            grid_detailsinfo = $.fn.DtGrid.init(detailsinfo_tables.dtGridOption);
            grid_detailsinfo.diyparameters = getObjDtgrid();
            grid_detailsinfo.load();
          },
          // 查看价格方案
          skanPricePlan: function(pricePlanSetId) {
            $.ajax({
              type: "post",
              url: ctx + "/tieredprice/tieredPriceCtrl/queryAllByPricePlanSetId.do",
              data: {
                "pricePlanSetId": pricePlanSetId
              },
              async: false,
              beforeSend: function() {},
              success: function(data) {
                if (data.result === "1") {
                  var str_name = '', // 方案名称
                    str_table = '', // 方案表格内容
                    str_course = '', // 价格方案应用的课程单元
                    str_table_head = '', // 表格thead
                    str_table_body_first = '', // 表格tbody中的第一行tr
                    str_table_body_common = '', // 表格tbody中第二行以及之后的tr
                    pricePlanList = pricePlanListForChange = data.data.pricePlanList,
                    col_len = pricePlanList.length, // 横向价格列数
                    row_len = pricePlanList[0].tieredPringList.length + 2, // 纵向阶梯行数(额外包括价格名称和价格增课时行)
                    j = 0; // 表格纵向行数(包含thead、tbody中的行)
                  // 方案名称
                  str_name = data.data.pricePlanSetName;
                  // 方案表格数据
                  str_table_head += '<thead><tr><th>课时区间</th>';
                  str_table_body_first += '<tbody><tr id="td-second-title"><td></td>';
                  // 以纵向行数循环添加阶梯区间
                  for (; j < row_len; j++) {
                    // 以横向列数循环添加价格
                    for (var i = 0; i < col_len; i++) {
                      // 第一行为名称，只添加一次
                      if (j === 0) {
                        str_table_head += '<th colspan="2">' + pricePlanList[i].pricePlanName + '</th>';
                        // 第二行为价格和课时，只添加一次
                      } else if (j === 1) {
                        str_table_body_first += '<td>价格</td><td>赠课时</td>';
                        // 从第三行开始，为阶梯区间。可用循环方式添加
                      } else {
                        if (i === 0)
                          str_table_body_common += '<tr><td>' + pricePlanList[i].tieredPringList[j - 2].stepFrom + '-' + pricePlanList[i].tieredPringList[j - 2].stepTo + '</td>';
                        str_table_body_common += '<td>' + pricePlanList[i].tieredPringList[j - 2].price + '</td><td>' +
                          pricePlanList[i].tieredPringList[j - 2].freeNum + '</td>';
                      }
                    }
                    // 从第二行开始要添加结束(</tr>)标签
                    str_table_body_common += '</tr>';
                  }
                  str_table_head += '</tr></thead>';
                  str_table_body_first += '</tr>';
                  str_table_body_common += '</tbody';
                  str_table += str_table_head + str_table_body_first + str_table_body_common;
                  // 应用课程范围
                  $.each(data.data.curriculaList, function(index, key) {
                    str_course += '<li title="' + key.curriculaName + '">' + key.curriculaName + '</li>';
                  });
                  $('#scheme-name').html('方案名称：' + str_name); // 价格方案名称
                  $('#version-name').html('版本号：' + data.data.version);
                  $('#table-scheme').html(str_table); // 方案表格内容
                  $('#select-course-body').html(str_course); // 选择的课程单元内容
                  $('#add-scheme').modal({
                    backdrop: "static"
                  });
                } else {
                  showAlertInfo('error', '获取价格方案数据失败！');
                }
              },
              complete: function(xhr) {
                var sessionStatus = xhr.getResponseHeader('sessionstatus');
                if (sessionStatus == 'timeout') {
                  location.reload();
                }
              }
            });
          },
          editContractNumber: function() {
            var checked = grid_detailsinfo.getCheckedRecords(),
              length = checked.length;
            if (length !== 1) {
              return showAlertInfo('fail', '请选择一个订单');
            }
            $('#contractNumberInput').val(checked[0].contractNumber);
            $('#confirmEditContractNumber').attr('data-code', checked[0].A);
            $('#editContractNumberModal').modal({
              backdrop: 'static'
            });
          },
          confirmEditContractNumber: function() {
            var code = $('#contractNumberInput').val(),
              reg = /^[a-zA-Z\d]+$/;
            if (!reg.test(code)) {
              return showAlertInfo('fail', '合同编码格式错误', 'tips:合同编码只能由字母和数字组成')
            }
            $.ajax({
              type: "POST",
              url: "${ctx}/billMgr/billMgrCtrl/updateVipContractNumber.do",
              data: {
                studentRegisterCode: $('#confirmEditContractNumber').attr('data-code'),
                contractNumber: code
              },
              dataType: "json",
              success: function(msg) {
                $('#editContractNumberModal').modal('hide');
                if (msg.result == "1") {
                  showAlertInfo("success", msg.message);
                  grid_detailsinfo.refresh(true);
                } else {
                  showAlertInfo("error", msg.message);
                }
              }
            });
          },
          // 批量取消订单
          bulkCancelOrder: function() {
            var checkedBill = grid_detailsinfo.getCheckedRecords();
            var lengthBill = checkedBill.length;
            if (lengthBill < 1) {
              return showAlertInfo('fail', "请至少选择一个订单");
            }
            var stuRegCodes = [];
            var getFlagisReturn = true;
            var getInvoiced = [];
            for (var m = 0; m < lengthBill; m++) {
              var nowTimes = checkedBill[m].L && checkedBill[m].L.replace(/\/|-/g, "") || 0;
              var today = getFomatDate('ymd', '');
              nowTimes = nowTimes === today;
              // console.log(checkedBill[m]);
              if (checkedBill[m].T == "√" || (checkedBill[m].PM == 0) && ("" == checkedBill[m].U)) {
                return showAlertInfo("fail","取消订单失败", "订单：" + checkedBill[m].A + "不能取消订单，请重新选择需要取消的订单！");
              } else {
                // 对操作员判断 （有按钮权限，订单是今日的订单且订单的操作者是本账户的可以进行取消订单，否则不能取消订单）
                if (checkedBill[m].buttonStatus == 0 && (!nowTimes || checkedBill[m].RA !== "<#if Session.PXJY_LOGIN_USER??><#if Session.PXJY_LOGIN_USER.name??>${Session.PXJY_LOGIN_USER.name}</#if></#if>")) {
                  return showAlertInfo("fail", "取消订单失败","订单：" + checkedBill[m].A + "不能取消订单，请重新选择需要取消的订单！");
                  // 收款审核的订单操作（如果订单和操作员都满足则还需要判断订单是否是已经确认收款且未取消审核的订单，如果是则不能进行取消订单操作，并且给提示）
                } else if (checkedBill[m].auditStatus === "1") {
                  return showAlertInfo("fail","取消订单失败", "订单：" + checkedBill[m].A + "已经确认收款,请取消审核再进行取消订单!");
                 // 如果是已开票状态的需要进行警告
                } else {
                  if(checkedBill[m].invoiceStatus== "3") {
                    getFlagisReturn = false;
                    getInvoiced.push(checkedBill[m].A);
                  }
                  stuRegCodes.push(checkedBill[m].A);
                }
              }
            }
            if(!getFlagisReturn) {
              $("#confirmIsReturn").attr({
                'data-codes': String(stuRegCodes),
              }).addClass('batchConfirmReturn');

              $("#billInvoiceCon").html(String(getInvoiced)+" 订单已经开具发票，如继续取消订单，请确认发票已经退回！")
              $("#billInvoiceModal").modal("show");

            } else {
              $("#bulkCancelBtn").attr('data-codes', String(stuRegCodes));
              $("#bulkDelDiv").modal("show");
            }
          }
        };
        // 点击确定批量取消订单
        $("body").on('click', '#bulkCancelBtn,.batchConfirmReturn', function() {
          $.ajax({
            url: ctx + '/billMgr/billMgrCtrl/batchCancelBill.do',
            type: 'post',
            dataType: 'json',
            data: {
              studentRegisterCodes: $(this).attr("data-codes")
            },
            beforeSend:function() {
              showLoading();
            }, 
            complete:function() {
              closeLoading();
            },
            success: function(msg) {
              $("#bulkDelDiv").modal("hide");
              $("#billInvoiceModal").modal("hide");
              var errorCodes = [];
              if (msg.result == 0) {
                for (var n = 0; n < msg.data.length; n++) {
                  errorCodes.push(msg.data[n].studentRegisterCode);
                }
                closeLoading();
                showAlertInfo("fail","取消订单失败", "订单" + String(errorCodes) + "取消订单失败！");
              } else {
                if (msg.data.length == 0) {
                  closeLoading();
                  showAlertInfo("success", "订单批量取消成功！");
                  grid_baseinfo.refresh(true);
                  grid_detailsinfo.refresh(true);
                } else {
                  for (var n = 0; n < msg.data.length; n++) {
                    errorCodes.push(msg.data[n].studentRegisterCode);
                  }
                  closeLoading();
                  showAlertInfo("success","取消订单失败", "其中订单" + String(errorCodes) + "取消订单失败！");
                  grid_detailsinfo.refresh(true);
                  grid_baseinfo.refresh(true);
                }
              }
            }
          })
        });
        /*优惠信息*/
        var cheapDetailInfo = {
          grid_cheapinfo: "",
          path: function() {
            return getProjectPath()
          },
          isInit: 0,
          initFunc: function() {
            if (cheapDetailInfo.isInit === 0) {
              $("#tb_main_body_cheapinfo").html("");
              $("#tb_main_tool_cheapinfo").html("");
              cheapDetailInfo.initTable();
            }
          },
          //初始化表格数据
          initTable: function() {
            cheapDetailInfo.isInit = 1;
            var cheapinfo_tables = {};
            var that = this;
            //定义表格列属性
            cheapinfo_tables.dtGridColumns = [{
              id: 'SN',
              title: '学员编码',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'A',
              title: '订单编码',
              type: 'string',
              columnClass: 'text-center',
              hide: true
            }, {
              id: 'StuN',
              title: '学员姓名',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'RN',
              title: '订单类型',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: '_CList',
              title: '课程单元（课时）',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'CH_A',
              title: '课时',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'MA',
              title: '课程价格',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'MB',
              title: '优惠',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'P_A',
              title: '折扣',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'XA',
              title: '优惠备注',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'X_D',
              title: '优惠后金额',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'PM',
              title: '实付金额',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'RA',
              title: '报名员',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'Y',
              title: '报名校区',
              type: 'string',
              columnClass: 'text-center'
            }];
            //定义表格
            cheapinfo_tables.dtGridOption = {
              lang: 'zh-cn',
              freezecol: '',
              freezerow: '',
              ajaxLoad: true,
              loadURL: '${ctx}/billMgr/billMgrCtrl/newQueryByPage.do',
              exportFileName: '优惠信息',
              columns: cheapinfo_tables.dtGridColumns,
              /*check:true,*/
              // totalCountCol: [11, 12],
              totalCountColById: ['X_D', 'PM'],
              gridContainer: 'tb_main_body_cheapinfo',
              toolbarContainer: 'tb_main_tool_cheapinfo',
              tools: 'refresh|faseQuery|export[excel,pdf,]|print',
              pageSize: initPageSize,
              pageSizeLocal: 'true',
              pageSizeName: 'dt_billMgrList_pagesize',
              pageSizeLimit: [10, 20, 50, 100, 500]
            };
            grid_cheapinfo = $.fn.DtGrid.init(cheapinfo_tables.dtGridOption);
            grid_cheapinfo.diyparameters = getObjDtgrid();
            grid_cheapinfo.load();
          },
          getCheckList: function() {
            return grid_cheapinfo.getCheckedRecords();
          },
          refresh: function() {
            grid_cheapinfo.refresh(true);
          }
        };
        /*付款记录*/
        var historyPay = {
          grid_history: "",
          path: function() {
            return getProjectPath()
          },
          isInit: 0,
          initFunc: function() {
            if (historyPay.isInit === 0) {
              $("#tb_main_body_history").html("");
              $("#tb_main_tool_history").html("");
              historyPay.initTable();
            }
          },
          //初始化表格数据
          initTable: function() {
            historyPay.isInit = 1;
            var history_tables = {};
            var that = this;
            //定义表格列属性
            history_tables.dtGridColumns = [{
              id: 'studentRegisterCode',
              title: '订单编码',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'studentSn',
              title: '学员编码',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'studentName',
              title: '学员姓名',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'money',
              title: '金额',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'isAccountPay',
              title: '账户余额支付',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'payTypeName',
              title: '支付方式',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'dateStamp',
              title: '付款日期',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'areaName',
              title: '收费校区',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'registrarCode',
              title: '操作员',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'memo',
              title: '备注',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'isAudited',
              title: '已审核',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'auditDate',
              title: '审核日期',
              type: 'string',
              columnClass: 'text-center'
            }, {
              id: 'auditorName',
              title: '审核人',
              type: 'string',
              columnClass: 'text-center'
            }];
            //定义表格
            history_tables.dtGridOption = {
              lang: 'zh-cn',
              freezecol: '',
              freezerow: '',
              ajaxLoad: true,
              loadURL: '${ctx}/billMgr/billMgrCtrl/getStudentRegisterPayRecordData.do',
              exportFileName: '付款记录',
              columns: history_tables.dtGridColumns,
              gridContainer: 'tb_main_body_history',
              toolbarContainer: 'tb_main_tool_history',
              tools: 'refresh|faseQuery|export[excel,pdf,]|print',
              pageSize: initPageSize,
              pageSizeLocal: 'true',
              pageSizeName: 'dt_billMgrList_pagesize',
              pageSizeLimit: [10, 20, 50, 100, 500]
            };
            grid_history = $.fn.DtGrid.init(history_tables.dtGridOption);
            grid_history.diyparameters = getObjDtgrid();
            grid_history.load();
          },
          getCheckList: function() {
            return grid_history.getCheckedRecords();
          },
          refresh: function() {
            grid_history.refresh(true);
          }
        };

        function getObjDtgrid() {
          var classModels = $('#classModels').val(),
            payType = $('#payType').val(),
            postData = {};
          if (classModels instanceof Array) {
            classModels = classModels.join(",");
          }
          if (payType instanceof Array) {
            payType = payType.join(",");
          }
          postData = {
            'classModels': classModels,
            'payType': payType,
            'isDiscount': $('#isDiscount').val() || '',
            'isPay': $('#isPay').val() || '',
            'gradeCode': $("#gradeCode").val() || '',
            'isDebt': $('#isDebt').val() || '',
            'isInsertClass': $('#isInsertClass').val() || '',
            'isEntoryClass': $('#isEntoryClass').val() || '',
            'isRefee': $('#isRefee').val() || '',
            'studentType': $('#studentType').val() || '',
            'billStatus': $('#billStatus').val() || '',
            'informationSource': $('#informationSource').val() || '',
            'schoolRegion': $('#schoolRegion').val() || '',
            'classLabel': $('#classLabel').val() || '',
            'billLabel': $('#signLabel').val() || '',
            'onlyClassRegion': $('#onlyClassRegion').val() || '', //上课校区
            'beginDate': $('#start_time').val(),
            'endDate': $('#end_time').val(),
            'billCode': $('#billCode').val() || '', //订单编码
            'studentName': $('#studentCodeOrName').val() || '', //报名学员姓名
            'studentCode': $('#studentCodeOrName').val() || '', //报名学员编码
            'classCode': $('#classCodeOrName').val() || '', //班级编码
            'className': $('#classCodeOrName').val() || '', //班级名称
            'createName': $('#createName').val() || '', //创建人姓名
            'stuPhone': $('#stuPhone').val() || '', // 学员电话
            'billCreatorName': $('#billCreatorName').val() || '', //咨询单创建人
            'salesPartnerName': $('#salesPartnerName').val() || '',
            'quarterCode': $('#claSemesterCode').val() || '', //学期
            'productName': $('#course').val() || '', //课程
            'planYear': $('#planYear').val(), //计划上课年度
            'planAreaCode': $('#planAreaCode').val(), //计划上课校区
            'contractNumber': $('#contractNumberFilter').val(), //合同编号
            'invoiceStatus': $('#invoice').val() || '', //申请状态
          };
          if (globalCurrentNum === 1 || globalCurrentNum === 2) {
            postData.exportOfQueryFlag = "newQueryByPageOfBillMgrCtrlExport";
          }
          if(globalCurrentNum === 4){
          	 postData.exportOfQueryFlag = "newQueryPayRecordDataListExport";
          }
          if ($('#class-region').val() === '1') { //复选框
            postData.classRegion = postData.schoolRegion;
          } else {
            postData.classRegion = "";
          }
          return postData;
        }

        function getStudentName(stuName) {
          DetailBaseInfo.search_stuN(stuName);
        }

        function getClassName(className) {
          DetailBaseInfo.search_classN(className);
        }
        /*vip学员缴费*/
        function forwordssPay(orderCode) {
          location.assign("${ctx}/signup/signupClassCtrl/vipPayList.do?orderManage&orderCode=" + orderCode);
        }

        function goProductBag(orderCode) {
          location.assign("${ctx}/productbag/productBagCtrl/productBagPayList.do?signupCodes=" + orderCode)
        }
        /*删除订单*/
        function forwordssDel(studentRegisterCode) {
          var postData = {
            "studentRegisterCode": studentRegisterCode
          };
          $.ajax({
            type: "POST",
            url: "${ctx}/billMgr/billMgrCtrl/deleteOrder.do",
            data: postData,
            dataType: "json",
            success: function(msg) {
              if (msg.result == "1") {
                showAlertInfo("success", msg.message);
                DetailBaseInfo.reload();
              } else {
                showAlertInfo("error", msg.message);
                DetailBaseInfo.reload();
              }
            }
          });
        }
        /*学员分配*/
        function forwordssAssign(billNo) {
          var postData = {
            'studentRegisterCode': billNo
          };
          $.ajax({
            type: "POST",
            url: "${ctx}/billMgr/billMgrCtrl/toVipAssign.do",
            data: postData,
            dataType: "json",
            success: function(msg) {
              if (msg.result == "1") {
                showAlertInfo("success", msg.message);
                var classCode = msg.message.split("：")[1];
                location.assign("${ctx}/arrange/arrangeCtrl/getClassCodesvip.do?classcode=" + classCode);
              } else if (msg.result == "2") {
                showAlertInfo("success", msg.message);
                location.assign("${ctx}/arrange/adjustClassCtrl/adjustClassList.do");
              } else {
                showAlertInfo("error", msg.message);
                location.reload();
              }
            }
          });
        }
        /*大班学员缴费*/
        function classStudentPayT(orderCode) {
          $.ajax({
            type: "POST",
            url: "${ctx}/signup/signupClassCtrl/getIsTurnClassPay.do",
            data: "orderCode=" + orderCode,
            dataType: "json",
            success: function(msg) {
              if (msg.result === "1") {
                location.assign("${ctx}/signup/signupClassCtrl/turnClassPay.do?orderManage&orderCode=" + orderCode);
              } else {
                location.assign("${ctx}/signup/signupClassCtrl/signupPayListPlus.do?orderManage&orderCode=" + orderCode);
              }
            }
          });
        }

        /*弹出编辑销售合伙人弹窗*/
        function goEditSalerPartnerForm() {
          var recordCount = grid_detailsinfo.getCheckedRecords().length;

          if (recordCount == 1) {
            var studentRegisterCode = grid_detailsinfo.getCheckedRecords()[0].A

            $.ajax({
              type: "POST",
              url: "${ctx}/billMgr/billMgrCtrl/querySalePartner.do",
              data: {
                "studentRegisterCode": studentRegisterCode
              },
              dataType: "json",
              success: function(map) {
                closeLoading();
                $("#editPartnerDiv").modal();
                $("#saleMen1").val(map.saleAName);
                $("#saleMen2").val(map.saleBName);

                $("#saleMen1").attr("data-value", map.saleAId);
                $("#saleMen2").attr("data-value", map.saleBId);
              }
            });
          } else {
            return showAlertInfo('fail', '请选择一条订单详细信息！');
          }
        }
        /*进班时间修改*/
        function goclasstime() {
          var recordCount = grid_detailsinfo.getCheckedRecords().length;
          $('#edit_time').val(getFomatDate('ymdhm', '-'));
          if (recordCount == 1) {
            $("#goclassDiv").modal();
          } else {
            return showAlertInfo('fail', '请选择一条订单详细信息！');
          }
        }
        $("#gosubmit").click(function() {
          showLoading();
          var dateTime = $("#edit_time").val();
          var studentRegisterCode = grid_detailsinfo.getCheckedRecords()[0].A
          $.ajax({
            type: "POST",
            url: "${ctx}/billMgr/billMgrCtrl/updateStudentEnterClassTime.do",
            data: {
              "studentRegisterCode": studentRegisterCode,
              "dateTime": dateTime
            },
            dataType: "json",
            success: function(msg) {
              closeLoading();
              if (msg.result === "1") {
                grid_detailsinfo.refresh(true);
                $('#goclassDiv').modal('hide');
                return showAlertInfo('success', msg.message);
              } else {
                return showAlertInfo('fail', msg.message);
              }
            }
          });
        });

        /*编辑销售合伙人提交请求*/
        $("#goEditPartnerSubmit").click(function() {
          showLoading();
          var studentRegisterCode = grid_detailsinfo.getCheckedRecords()[0].A
          if ($('#saleMen1').val() === '') {
            $('#saleMen1').attr("data-value", '')
          }
          if ($('#saleMen2').val() === '') {
            $('#saleMen2').attr("data-value", '')
          }
          var param = {
            "studentRegisterCode": studentRegisterCode, //订单号
            "salesPartnerAId": $('#saleMen1').attr("data-value"), // 销售合伙人1id
            "salesPartnerAName": $('#saleMen1').val(), // 销售合伙人1名字
            "salesPartnerBId": $('#saleMen2').attr("data-value"), // 销售合伙人2id
            "salesPartnerBName": $('#saleMen2').val(), // 销售合伙人2名字
          };
          param = JSON.stringify(param);
          $.ajax({
            type: "POST",
            url: "${ctx}/billMgr/billMgrCtrl/updateSalePartner.do",
            data: {
              "param": param
            },
            dataType: "json",
            success: function(msg) {
              closeLoading();
              if (msg.result === "1") {
                grid_detailsinfo.refresh(true);
                $('#editPartnerDiv').modal('hide');
                return showAlertInfo('success', msg.message);
              } else {
                return showAlertInfo('fail', msg.message);
              }
            }
          });
        });
        /**
         * @Author   zhucaiyun
         * @DateTime 2016-08-26
         * @param    null
         * 跳转到订单管理查看课次消费明细页面（studentRegisterCode-订单编码）
         */
        function goBillDetail() {
          var recordCount = grid_detailsinfo.getCheckedRecords().length;
          if (recordCount === 1) {
            var studentRegisterCode = grid_detailsinfo.getCheckedRecords()[0].A;
            var studentIntoClaTime = grid_detailsinfo.getCheckedRecords()[0].enterClassTime;
            var classUnit = grid_detailsinfo.getCheckedRecords()[0]._CList;
            window.open("${ctx}/arrange/adjustClassCtrl/registerItemConsumeDtls.do?registerCode=" + studentRegisterCode + "&enterClassTime=" + studentIntoClaTime + "&classUnit=" + classUnit);
          } else {
            showAlertInfo('fail', '请选择一条订单详细信息');
          }
        };
        // 修改学员类型
        function changeStuType() {
          var recordCount = grid_detailsinfo.getCheckedRecords().length;
          if (recordCount == 1) {
            $("#alertStuType").modal();
          } else {
            return showAlertInfo('fail', '请选择一条订单详细信息！');
          }
        }
        $("#confirmStuType").click(function() {
          var registerReason = $("#newStudentType").val();
          var studentRegisterCode = grid_detailsinfo.getCheckedRecords()[0].A
          $.ajax({
            type: "POST",
            url: "${ctx}/billMgr/billMgrCtrl/updateRegisterReasonByStudentRegisterCode.do",
            data: {
              "studentRegisterCode": studentRegisterCode,
              "registerReason": registerReason
            },
            dataType: "json",
            success: function(msg) {
              if (msg.result === "1") {
                grid_detailsinfo.refresh(true);
                $('#alertStuType').modal('hide');
                return showAlertInfo('success', '修改学生类型成功！');
              } else {
                return showAlertInfo('fail', '修改学生类型失败');
              }
            }
          });
        });

        //批量业绩确认弹窗   2017/07/19 change by zhucaiyun 需要提示选中的个数以及选中的学员信息的展示
        $("#batchConfirmPerformance").click(function() {
          $("#batchBusTab").empty();
          var recordConent = grid_detailsinfo.getCheckedRecords();
          var recordCount = grid_detailsinfo.getCheckedRecords().length;
          var getContent = "<tr>" +
            "<td>学员编码</td>" +
            "<td>学员名称</td>" +
            "<td>订单编号</td>" +
            "<td>已付款金额</td>" +
            "</tr>";
          if (recordCount >= 1) {
            $.each(recordConent, function(index, el) {
              getContent += "<tr>" +
                "<td>" + el.SN + "</td>" +
                "<td>" + el.StuN + "</td>" +
                "<td>" + el.A + "</td>" +
                "<td>" + el.PM + "</td>" +
                "</tr>"
            });
            $("#batchBusTab").html(getContent);
            $("#recordNum").text(recordCount);
            $("#batchConfirm").modal();
          } else {
            showAlertInfo('fail', '请至少选择一条记录后，再操作！');
          }
        });

        //批量业绩确认
        $("#batchConfirmBtn").click(function() {
          $("#batchConfirm").modal("hide");
          var recordCount = grid_detailsinfo.getCheckedRecords().length;
          if (recordCount >= 1) {
            var studentRegisterCodes = [];
            for (i = 0; i < recordCount; i++) {
              //将选中的student的studentcode拼接成字符串
              studentRegisterCodes.push(grid_detailsinfo.getCheckedRecords()[i].A);
            }
            studentRegisterCodes = studentRegisterCodes.toString();

            $.ajax({
              type: "POST",
              url: "${ctx}/billMgr/billMgrCtrl/batchConfirmBillStatus.do",
              data: {
                "studentRegisterCodes": studentRegisterCodes
              },
              dataType: "json",
              success: function(result) {
                if (parseInt(result.result) == 1) {
                  showAlertInfo('success', result.message);
                  grid_detailsinfo.refresh(true);
                } else
                  showAlertInfo('fail', "批量确认业绩失败");
              },
              error: function() {
                showAlertInfo('fail', '连接服务器失败！');
              }
            });
          } else {
            showAlertInfo('fail', '请至少选择一条记录后，再操作！');
          }
        });

        //业绩确认
        function confirmResult() {
          var recordCount = grid_detailsinfo.getCheckedRecords().length;
          if (recordCount == 1) {
            var studentRegisterCodes = [];
            //将选中的student的studentcode拼接成字符串
            for (i = 0; i < recordCount; i++) {
              studentRegisterCodes.push(grid_detailsinfo.getCheckedRecords()[i].A);
            }
            studentRegisterCodes = studentRegisterCodes.toString();
            $('#confirmPrefor').attr('data-value', studentRegisterCodes);
            var businessAlloc = '<div class="modal-dialog">' +
              '<div class="modal-content">' +
              '<div class="modal-header">' +
              '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>' +
              '<h5 class="modal-title"><strong>业绩确认</strong></h5>' +
              '</div>' +
              '<div class="modal-body">' +
              '<div id="tb_main_body_histoty" class="dt-grid-container">' +
              '<h2 class = "performance-allocation">业绩分配表</h2>' +
              '<table class="performance-table">' +
              '<tr>' +
              '<td> </td>' +
              '<td>姓名</td>' +
              '<td>成单数</td>' +
              '<td>成单金额</td>' +
              '</tr>' +
              '<tr>' +
              '<td>报名员</td>' +
              '<td id="registerId">' + grid_detailsinfo.getCheckedRecords()[0].RA + '</td>' +
              '<td class="nowrap">' +
              //  btn-success    btn-success
              '<i class="fa fa-minus btn-success" id="registration-number-minus"' +
              'onclick="minusNumber(\'#registration-number-minus\',\'#registration-number-add\',\'#sellerNumberOne\',\'#sellerNumberTwo\');"></i>' +
              '<input type="text"  value=' + getValue("#registrationNumber", "RNumber") + ' id="registrationNumber" onblur="blurNumber(\'#registration-number-add\',\'#registration-number-minus\',\'#sellerNumberOne\',\'#sellerNumberTwo\');">' +
              '<i class="fa fa-plus btn-success" id="registration-number-add"' +
              'onclick="addNumber(\'#registration-number-add\',\'#registration-number-minus\',\'#sellerNumberOne\',\'#sellerNumberTwo\');"></i>' +
              '</td>' +
              //  btn-success btn-success
              '<td class="nowrap">' +
              '<i class="fa fa-minus btn-success" id="registration-money-minus" onclick="minusNumber(\'#registration-money-minus\',\'#registration-money-add\',\'#sellerMoneyOne\',\'#sellerMoneyTwo\');"></i>' +
              '<input type="text" value=' + getValue("#registrationMoney", "RMoney") + ' id="registrationMoney" oncblur="blurNumber(\'#registration-money-add\',\'#registration-money-minus\',\'#sellerMoneyOne\',\'#sellerMoneyTwo\');">' +
              '<i class="fa fa-plus btn-success" id="registration-money-add" onclick="addNumber(\'#registration-money-add\',\'#registration-money-minus\',\'#sellerMoneyOne\',\'#sellerMoneyTwo\');"></i>' +
              '</td>' +
              '</tr>';
            if (grid_detailsinfo.getCheckedRecords()[0].salesPartnerAName) {
              businessAlloc +=
                '<tr>' +
                '<td>销售合伙人1</td>' +
                '<td id="salerOne">' +
                grid_detailsinfo.getCheckedRecords()[0].salesPartnerAName +
                '</td>' +
                // btn-success btn-success btn-success btn-success
                '<td class="nowrap">' +
                '<i class="fa fa-minus btn-success" id="sales-number-minus" onclick="minusNumber(\'#sales-number-minus\',\'#sales-number-add\',\'#registrationNumber\',\'#sellerNumberTwo\');"></i>' +
                '<input type="text" value=' + getValue("#sellerNumberOne", "SNOne") + ' id="sellerNumberOne" onblur="blurNumber(\'#sales-number-add\',\'#sales-number-minus\',\'#registrationNumber\',\'#sellerNumberTwo\');">' +
                '<i class="fa fa-plus btn-success" id="sales-number-add" onclick="addNumber(\'#sales-number-add\',\'#sales-number-minus\',\'#registrationNumber\',\'#sellerNumberTwo\');"></i>' +
                '</td>' +
                '<td class="nowrap">' +
                '<i class="fa fa-minus btn-success" id="sales-money-minus" onclick="minusNumber(\'#sales-money-minus\',\'#sales-money-add\',\'#registrationMoney\',\'#sellerMoneyTwo\');"></i>' +
                '<input type="text" value=' + getValue("#sellerMoneyOne", "SMOne") + ' id="sellerMoneyOne" onblur="blurNumber(\'#sales-money-add\',\'#sales-money-minus\',\'#registrationMoney\',\'#sellerMoneyTwo\');">' +
                '<i class="fa fa-plus btn-success" id="sales-money-add" onclick="addNumber(\'#sales-money-add\',\'#sales-money-minus\',\'#registrationMoney\',\'#sellerMoneyTwo\');"></i>' +
                '</td>' +
                '</tr>';
            } else {
              businessAlloc +=
                '<tr>' +
                '<td>销售合伙人1</td>' +
                '<td>' +

                '</td>' +
                '<td>' +

                '</td>' +
                '<td>' +

                '</td>' +
                '</tr>';
            }
            if (grid_detailsinfo.getCheckedRecords()[0].salesPartnerBName) {
              businessAlloc +=
                '<tr>' +
                '<td>销售合伙人2</td>' +
                '<td id="salerTwo">' +
                grid_detailsinfo.getCheckedRecords()[0].salesPartnerBName +
                '</td>' +
                // btn-success btn-success btn-success btn-success
                '<td class="nowrap">' +
                '<i class="fa fa-minus btn-success" id="salesB-number-minus" onclick="minusNumber(\'#salesB-number-minus\',\'#salesB-number-add\',\'#registrationNumber\',\'#sellerNumberOne\');"></i>' +
                '<input type="text" value=' + getValue("#sellerNumberTwo", "SNTwo") + ' id="sellerNumberTwo" onblur="blurNumber(\'#salesB-number-add\',\'#salesB-number-minus\',\'#registrationNumber\',\'#sellerNumberOne\');">' +
                '<i class="fa fa-plus btn-success" id="salesB-number-add" onclick="addNumber(\'#salesB-number-add\',\'#salesB-number-minus\',\'#registrationNumber\',\'#sellerNumberOne\');"></i>' +
                '</td>' +
                '<td class="nowrap">' +
                '<i class="fa fa-minus btn-success" id="salesB-money-minus" onclick="minusNumber(\'#salesB-money-minus\',\'#salesB-money-add\',\'#registrationMoney\',\'#sellerMoneyOne\');"></i>' +
                '<input type="text" value=' + getValue("#sellerMoneyTwo", "SMTwo") + ' id="sellerMoneyTwo" onblur="blurNumber(\'#salesB-money-add\',\'#salesB-money-minus\',\'#registrationMoney\',\'#sellerMoneyOne\');">' +
                '<i class="fa fa-plus btn-success" id="salesB-money-add" onclick="addNumber(\'#salesB-money-add\',\'#salesB-money-minus\',\'#registrationMoney\',\'#sellerMoneyOne\');"></i>' +
                '</td>' +
                '</tr>' +
                '</table>' +
                '</div>' +
                '</div>' +
                '<div class="modal-footer">' +
                '<button type="button" class="btn btn-primary" id="eqDistributedt" onclick="eqDistributedt()">平均分配</button>' +
                '<button type="button" class="btn btn-primary" id="confirmReport" onclick="confirmReport()">确认</button>' +
                '<button type="button" class="btn btn-effect-ripple btn-danger" data-dismiss="modal">关闭</button>' +
                '</div>' +
                '</div>' +
                '</div>';
            } else {
              businessAlloc +=
                '<tr>' +
                '<td>销售合伙人2</td>' +
                '<td>' +
                '</td>' +
                '<td>' +

                '</td>' +
                '<td>' +

                '</td>' +
                '</tr>' +
                '</table>' +
                '</div>' +
                '</div>' +
                '<div class="modal-footer">' +
                '<button type="button" class="btn btn-primary" id="eqDistributedt" onclick="eqDistributedt()">平均分配</button>' +
                '<button type="button" class="btn btn-primary" id="confirmReport" onclick="confirmReport()">确认</button>' +
                '<button type="button" class="btn btn-effect-ripple btn-danger" data-dismiss="modal">关闭</button>' +
                '</div>' +
                '</div>' +
                '</div>';
            }
            $("#isConfirm").html(businessAlloc);
            $("#isConfirm").modal();
          } else {
            showAlertInfo('fail', '请选择一条记录后，再操作！');
          }
        }
        // 给value值赋值，如果销售不存在，则是undefined；如果存在则判断是否为0，否则输出值;
        function getValue(selectorId, recordName) {
          switch (recordName) {
            case "RNumber":
              var valueNumber = parseInt(grid_detailsinfo.getCheckedRecords()[0].RNumber) || 0;
              break;
            case "RMoney":
              var valueNumber = parseInt(grid_detailsinfo.getCheckedRecords()[0].RMoney) || 0;
              break;
            case "SNOne":
              var valueNumber = parseInt(grid_detailsinfo.getCheckedRecords()[0].SNOne) || 0;
              break;
            case "SMOne":
              var valueNumber = parseInt(grid_detailsinfo.getCheckedRecords()[0].SMOne) || 0;
              break;
            case "SNTwo":
              var valueNumber = parseInt(grid_detailsinfo.getCheckedRecords()[0].SNTwo) || 0;
              break;
            case "SMTwo":
              var valueNumber = parseInt(grid_detailsinfo.getCheckedRecords()[0].SMTwo) || 0;
              break;
            default:

          }
          return (valueNumber + "%");
        }
        // 判断input里面的value值是否是100%，如果是，给其换btn-success为btn-success ②input值不增加
        function addNumber(selector, selectorMinus, selectorOneSeller, selectorTwoSeller) {
          var nowValue = $(selector).siblings('input').val();
          var intNowValue = parseInt(nowValue) / 100;
          // 判断销售合伙人1和2是否存在
          var seller = parseInt($(selectorOneSeller).val() || 0) / 100;
          var sellerTwo = parseInt($(selectorTwoSeller).val() || 0) / 100;
          if ((intNowValue + seller + sellerTwo) < 1) {
            $(selectorMinus).removeClass("btn-default").addClass("btn-success");
            $(selectorOneSeller).next(".fa-plus").removeClass("btn-default").addClass("btn-success");
            $(selectorTwoSeller).next(".fa-plus").removeClass("btn-default").addClass("btn-success");
            intNowValue = ((intNowValue + 0.01) * 100).toFixed(0);
            var showNowValue = intNowValue + "%";
            $(selector).siblings('input').attr('value', showNowValue);
            $(selector).siblings('input').val(showNowValue);
            if ((intNowValue / 100 + seller + sellerTwo) >= 1) {
              $(selector).removeClass("btn-success").addClass("btn-default");
              $(selectorOneSeller).next(".fa-plus").removeClass("btn-success").addClass("btn-default");
              $(selectorTwoSeller).next(".fa-plus").removeClass("btn-success").addClass("btn-default");
            }
          } else {
            $(selector).removeClass("btn-success").addClass("btn-default");
            $(selectorOneSeller).next(".fa-plus").removeClass("btn-success").addClass("btn-default");
            $(selectorTwoSeller).next(".fa-plus").removeClass("btn-success").addClass("btn-default");
          }
        }
        // 输入失去焦点时调用的函数
        function blurNumber(selector, selectorMinus, selectorOneSeller, selectorTwoSeller) {
          var nowValue = $(selector).siblings('input').val();
          var nowValueNumber = nowValue.replace(/%/, "");
          var reg = /^([1]?\d{1,2})$/;
          // 添加如果大于100的话
          if (($.trim(nowValueNumber) === "") || (!reg.test(nowValueNumber))) {
            showAlertInfo("fail", "请输入0-100的整数");
            $(selector).siblings('input').val("0%");
            return false;
          }
          var intNowValue = parseInt(nowValueNumber) / 100;
          // 判断销售合伙人1和2是否存在
          var seller = parseInt($(selectorOneSeller).val() || 0) / 100;
          var sellerTwo = parseInt($(selectorTwoSeller).val() || 0) / 100;
          if (intNowValue !== 0) {
            $(selectorMinus).removeClass("btn-default").addClass("btn-success");
          } else {
            $(selectorMinus).removeClass("btn-success").addClass("btn-default");
          }
          if ((intNowValue + seller + sellerTwo) < 1) {
            $(selector).removeClass("btn-default").addClass("btn-success");
            $(selectorOneSeller).next(".fa-plus").removeClass("btn-default").addClass("btn-success");
            $(selectorTwoSeller).next(".fa-plus").removeClass("btn-default").addClass("btn-success");
            var intNowValueNumber = (intNowValue * 100).toFixed(0);
            var showNowValue = intNowValueNumber + "%";
            $(selector).siblings('input').attr('value', showNowValue);
            $(selector).siblings('input').val(showNowValue);
            if ((intNowValueNumber / 100 + seller + sellerTwo) >= 1) {
              $(selector).removeClass("btn-success").addClass("btn-default");
              $(selectorOneSeller).next(".fa-plus").removeClass("btn-success").addClass("btn-default");
              $(selectorTwoSeller).next(".fa-plus").removeClass("btn-success").addClass("btn-default");
            }
          } else if ((intNowValue + seller + sellerTwo) === 1) {
            $(selector).removeClass("btn-success").addClass("btn-default");
            $(selectorOneSeller).next(".fa-plus").removeClass("btn-success").addClass("btn-default");
            $(selectorTwoSeller).next(".fa-plus").removeClass("btn-success").addClass("btn-default");
          }
        }
        // 减分配额
        /**
         * @Author   zhucaiyun
         * @DateTime 2016-09-07
         * @param    点击的i，相反的i，对应的其它两个成单数或者是成单金额的值
         * @param    {[class]}   selector          [点击的i的类]
         * @param    {[class]}   selectorAdd       [点击i的对应的另一个i]
         * @param    {[input>value]}   selectorOneSeller [其它的一个成单数或者是成单金额的值]
         * @return   {[null]}                     [null]
         */
        function eqDistributedt() {
          var salesNumber = 1;
          //看有几个销售合伙人
          if (grid_detailsinfo.getCheckedRecords()[0].salesPartnerAName) {
            salesNumber += 1;
          }
          if (grid_detailsinfo.getCheckedRecords()[0].salesPartnerBName) {
            salesNumber += 1;
          }
          var values = 100 / salesNumber;
          if (salesNumber === 3) {
            $("#registrationNumber").val("33%");
            $("#registrationMoney").val("33%");
            $("#sellerNumberOne").val("33%");
            $("#sellerMoneyOne").val("33%");
            $("#sellerNumberTwo").val("34%");
            $("#sellerMoneyTwo").val("34%");
            $(".nowrap").children("i").removeClass("btn-default").addClass("btn-success");
          } else {
            $("#registrationNumber").val(values + "%");
            $("#registrationMoney").val(values + "%");
            $("#sellerNumberOne").val(values + "%") || "";
            $("#sellerMoneyOne").val(values + "%") || "";
            $("#sellerNumberTwo").val(values + "%") || "";
            $("#sellerMoneyTwo").val(values + "%") || "";
            if (salesNumber === 1) {
              $(".fa-plus").removeClass('btn-success').addClass('btn-default');
              $(".fa-minus").removeClass('btn-default').addClass('btn-success');
            } else {
              $(".nowrap").children("i").removeClass("btn-default").addClass("btn-success");
            }
          }
        }

        function minusNumber(selector, selectorAdd, selectorOneSeller, selectorTwoSeller) {
          var nowMinusValue = $(selector).siblings('input').val();
          var intMinusNowValue = parseInt(nowMinusValue) / 100;
          var sellerMinus = parseInt($(selectorOneSeller).val() || 0) / 100;
          var sellerMinusTwo = parseInt($(selectorTwoSeller).val() || 0) / 100;

          if (intMinusNowValue > 0) {
            $(selectorAdd).removeClass("btn-default").addClass("btn-success");
            intMinusNowValue = ((intMinusNowValue - 0.01) * 100).toFixed(0);
            var showMinusNowValue = intMinusNowValue + "%";
            $(selector).siblings('input').attr('value', showMinusNowValue);
            $(selector).siblings('input').val(showMinusNowValue);
            if (((intMinusNowValue) / 100) <= 0) {
              $(selector).removeClass("btn-success").addClass("btn-default");
            }
            if ((intMinusNowValue / 100 + sellerMinus + sellerMinusTwo) < 1) {
              $(selectorAdd).removeClass("btn-default").addClass("btn-success");
              $(selectorOneSeller).next(".fa-plus").removeClass("btn-default").addClass("btn-success");
              $(selectorTwoSeller).next(".fa-plus").removeClass("btn-default").addClass("btn-success");
            }
          } else {
            $(selector).removeClass("btn-success").addClass("btn-default");
          }
        }
        // 业绩确认
        function confirmReport() {
          var numberOne = parseInt($("#registrationNumber").val()) || 0;
          var numberTwo = parseInt($("#sellerNumberOne").val()) || 0;
          var numberThree = parseInt($("#sellerNumberTwo").val()) || 0;
          var moneyOne = parseInt($("#registrationMoney").val()) || 0;
          var moneyTwo = parseInt($("#sellerMoneyOne").val()) || 0;
          var moneyThree = parseInt($("#sellerMoneyTwo").val()) || 0;
          if (((numberOne + numberTwo + numberThree) > 100) || ((moneyOne + moneyTwo + moneyThree) > 100)) {
            return showAlertInfo("fail", "各列之和不能大于1！");
          }
          $.ajax({
            type: "POST",
            url: "${ctx}/billMgr/billMgrCtrl/confirmBillStatus.do",
            data: {
              "studentRegisterCodes": $('#confirmPrefor').attr('data-value'),
              "billStatus": 1,
              "registerNumber": numberOne,
              "registerMoney": moneyOne,
              "sellerOneNumber": numberTwo,
              "sellerOneMoney": moneyTwo,
              "sellerTwoNumber": numberThree,
              "sellerTwoMoney": moneyThree,
            },
            dataType: "json",
            success: function(result) {

              if (parseInt(result.result) == 1) {
                showAlertInfo('success', "确认业绩成功");
                grid_detailsinfo.refresh(true);
                $('#isConfirm').modal('hide');
              } else
                showAlertInfo('fail', "确认业绩失败");
            },
            error: function() {
              showAlertInfo('fail', '连接服务器失败！')
            }
          })
        }
        //取消业绩
        function quiteResult() {
          var recordCount = grid_detailsinfo.getCheckedRecords().length;
          if (recordCount == 1) {
            var studentRegisterCodes = [];
            //将选中的student的studentcode拼接成字符串
            for (i = 0; i < recordCount; i++) {
              studentRegisterCodes.push(grid_detailsinfo.getCheckedRecords()[i].A);
            }
            studentRegisterCodes = studentRegisterCodes.toString();
            $('#quitePrefor').attr('data-value', studentRegisterCodes);
            $("#isCancel").modal();
          } else {
            showAlertInfo('fail', '请选择一条记录后，再操作！');
          }
        }
        $('#cancelReport').click(function() {
          $.ajax({
            type: "POST",
            url: "${ctx}/billMgr/billMgrCtrl/confirmBillStatus.do",
            data: {
              "studentRegisterCodes": $('#quitePrefor').attr('data-value'),
              'billStatus': 0
            },
            dataType: "json",
            success: function(result) {
              if (parseInt(result.result) == 1) {
                showAlertInfo('success', "取消业绩成功");
                grid_detailsinfo.refresh(true);
                $('#isCancel').modal('hide');
              } else
                showAlertInfo('fail', "取消业绩失败");
            },
            error: function() {
              showAlertInfo('error', '连接服务器失败！')
            }
          })
        });
        $("#confirmRemarks").click(function() {
          var remarksCon = $("#updateRemarks").val();
          var studentRegisterCode = grid_detailsinfo.getCheckedRecords()[0].A;
          $.ajax({
            type: "POST",
            url: "${ctx}/billMgr/billMgrCtrl/updateMemoByStudentRegisterCode.do",
            data: {
              "studentRegisterCode": studentRegisterCode,
              "memo": remarksCon
            },
            dataType: "json",
            success: function(msg) {
              if (msg.result === "1") {
                showAlertInfo('success', '修改备注成功！');
                grid_detailsinfo.refresh(true);
                $('#alertRemarks').modal('hide');
              } else {
                return showAlertInfo('fail', msg.message);
              }
            }
          });
        });
        //修改备注
        function changeRemarks() {
          var recordCount = grid_detailsinfo.getCheckedRecords().length;
          if ((recordCount == 1) && (grid_detailsinfo.getCheckedRecords()[0].billStatusName == "未确认")) {
            $('#updateRemarks').val(grid_detailsinfo.getCheckedRecords()[0].M_C);
            $("#alertRemarks").modal();
          } else if ((recordCount == 1) && grid_detailsinfo.getCheckedRecords()[0].billStatusName == "已确认") {
            return showAlertInfo('fail', '已业绩确认的订单不可以修改备注信息！');
          } else {
            return showAlertInfo('fail', '请选择一条订单详细信息！');
          }
        }
        $("#confirmRemarks").click(function() {
          var remarksCon = $("#updateRemarks").val();
          var studentRegisterCode = grid_detailsinfo.getCheckedRecords()[0].A;
          $.ajax({
            type: "POST",
            url: "${ctx}/billMgr/billMgrCtrl/updateMemoByStudentRegisterCode.do",
            data: {
              "studentRegisterCode": studentRegisterCode,
              "memo": remarksCon
            },
            dataType: "json",
            success: function(msg) {
              if (msg.result === "1") {
                showAlertInfo('success', '修改备注成功！');
                grid_detailsinfo.refresh(true);
                $('#alertRemarks').modal('hide');
              } else {
                return showAlertInfo('fail', msg.message);
              }
            }
          });
        });
        /*取消订单*/
        function todel(delpeo, deltime, studentRegisterCode, studentName, clssName, money, authority,invoiceStatus) {
          // 特殊权限者可以取消任意订单
          //更改权限；
          $("#A").html(studentRegisterCode);
          $("#StuN").html(studentName);
          $("#C_N").html(clssName);
          $("#PM").html(money);
          $("#L").html(deltime);
          $("#RA").html(delpeo);
          $("#buttonStatus").html(authority)
          $("#modalTitle").html("取消订单");
          //取消订单提示语
          var loginname = "<#if Session.PXJY_LOGIN_USER??><#if Session.PXJY_LOGIN_USER.name??>${Session.PXJY_LOGIN_USER.name}</#if></#if>";
          $("#delForm").data('bootstrapValidator').resetForm();
          $("#delForm").data('bootstrapValidator').resetForm(true).disableSubmitButtons(false);
          $("#node").html("")
          $("#memo").removeAttr("readonly");
          if(invoiceStatus == "3") {
            $("#billInvoiceCon").text("该订单已经开具发票，如继续取消订单，请确认发票已经退回！");
            $("#confirmIsReturn").removeClass('batchConfirmReturn').addClass('singleConfirmReturn');
            $("#billInvoiceModal").modal("show");
            return false;
          } else {
            $('#delDiv').modal({
              backdrop: false
            });
          }
        }
        $("body").on('click', '.singleConfirmReturn', function() {
          $("#billInvoiceModal").modal("hide");
          $('#delDiv').modal({
            backdrop: false
          });
        });
        // 确认进班
        function confirmClass() {
          var recordCount = grid_detailsinfo.getCheckedRecords().length;
          if (recordCount === 1) {
            var stuRegisterCode = grid_detailsinfo.getCheckedRecords()[0].A;
            $.ajax({
              type: "POST",
              url: "${ctx}/billMgr/billMgrCtrl/confirmEnterClass.do?studentRegisterCodes=" + stuRegisterCode,
              dataType: "json",
              success: function(msg) {
                if (msg.result === "1") {
                  showAlertInfo("success", msg.message);
                } else {
                  return showAlertInfo("fail", "确认进班失败");
                }
              }
            });
          } else {
            showAlertInfo("fail", "请选中一条订单详细信息")
          }
        }
        // 已经确认收款的订单，在点击取消订单时提示
        $("#tb_main_body_baseinfo").on('click', '.paid-money', function() {
          return showAlertInfo("fail", "订单已经确认收款,请取消审核再进行取消订单!");
        });

        $("#saleMen1").typeahead({
          source: function(request, process) {
            $.ajax({
              url: ctx + "/tieredprice/tieredPriceCtrl/getUserInfos.do",
              data: {
                "studentName": $('#saleMen1').val()
              },
              dataType: "json",
              success: function(data) {
                var data = data.data,
                  array = [],
                  len = data.length,
                  i = 0;
                if (len) {
                  for (; i < len; i++) {
                    array.push(data[i].name + '|' + data[i].id);
                  }
                } else {
                  $("#saleMen1").attr('data-value', '');
                }
                process(array);
              }
            });
          },
          minLength: 1,
          items: 5,
          updater: function(item) {
            return item; //这里一定要return，否则选中不显示，外加调用display的时候null reference错误。
          },
          displayText: function(item) {
            return item.split('|')[0]; //返回字符串
          },
          afterSelect: function(item) {
            return $('#saleMen1').attr("data-value", item.split('|')[1]);
          },
          delay: 100
        });
        $("#saleMen2").typeahead({
          source: function(request, process) {
            $.ajax({
              url: ctx + "/tieredprice/tieredPriceCtrl/getUserInfos.do",
              data: {
                "studentName": $('#saleMen2').val()
              },
              dataType: "json",
              success: function(data) {
                var data = data.data,
                  array = [],
                  len = data.length,
                  i = 0;
                if (len) {
                  for (; i < len; i++) {
                    array.push(data[i].name + '|' + data[i].id);
                  }
                } else {
                  $("#saleMen2").attr('data-value', '');
                }
                process(array);
              }
            });
          },
          minLength: 1,
          items: 5,
          updater: function(item) {
            return item; //这里一定要return，否则选中不显示，外加调用display的时候null reference错误。
          },
          displayText: function(item) {
            return item.split('|')[0]; //返回字符串
          },
          afterSelect: function(item) {
            return $('#saleMen2').attr("data-value", item.split('|')[1]);
          },
          delay: 100
        });

        // 查看发票信息 by zhucaiyun 
        function getDetailInvoice(invoiceCode) {
          $.ajax({
            url: ctx + '/invoice/pxFinanceInvoiceCtrl/getInvoiceInfo.do',
            type: 'post',
            dataType: 'json',
            data: {
              invoiceCode: invoiceCode
            },
            success: function(res) {
              var getInvoCon = "";
              var getInvoStatus = "";
              $.each(res.registerList, function(index, val) {
                getInvoCon += '<tr>'+
                                '<td>'+val.studentRegisterCode+'</td>'+
                                '<td class="hidden-xs">'+(val.classCode||"")+'</td>'+
                                '<td class="hidden-sm hidden-xs">'+(val.payMoney||0)+'</td>'+ //实付金额是已付款
                              '</tr>';
              });
              // 发票申请状态
              $.each(res.invoiceRecord, function(index, val) {
                getInvoStatus += '<div class="col-md-12">'+
                                    '<label class="control-label mr5">'+val.invoiceName+'</label>'+
                                    '<span>'+val.invoiceUser+'</span> '+
                                    '<span>'+val.invoiceTime+'</span>'+
                                  '</div>';
              });
              $("#invoiceBillInfo").html(getInvoCon);
              $("#getInvoiceMoney").text(res.invoiceMoney);
              $("#invoiceMemo").text(res.memo||"");
              $("#invoiceStatusName").text(res.invoiceStatusName);
              $(".invoice-history").html(getInvoStatus);
              $("#invoType").text(res.invoiceTypeName);
              // 普通发票
              if(res.invoiceType == "1") {
                // 单位
                if(res.invoiceTitle == "2") {
                  $(".nor-per,.pro-per").hide();
                  $(".nor-com").show();
                  $("#norComName").text(res.unitName||"");
                  $("#norComCode").text(res.taxNumber||"");
                } else {
                  $(".nor-com,.pro-per").hide();
                  $(".nor-per").show();
                  $("#norPerName").text(res.unitName||"");
                  
                }
              // 专用发票
              } else {
                $(".nor-com,.nor-per").hide();
                $(".pro-per").show();
                $("#proName").text(res.unitName);
                $("#proInvCode").text(res.taxNumber||"");
                $("#proBank").text(res.bankName||"");
                $("#proAccount").text(res.account||"");
                $("#proAdd").text(res.address||"");
                $("#proPhone").text(res.phone||"");
              }
              $("#invoiceDetailModal").modal("show");
            }
          });
          $("#cancelApplyInvoice").attr("dataCode",invoiceCode).hide();
        }      
        
        // 点击取消发票申请 by zhucaiyun
        function cancelApplyInvoice() {
          // 判断是否是同一个发票编号
          var recordCount = grid_detailsinfo.getCheckedRecords();
          var flagPass = true;
          if(recordCount.length < 1 ) {
            return showAlertInfo("fail","请至少选择一条记录，再进行操作！");
          }
          $.each(recordCount, function(index, val) {
            if(val.invoiceStatus !="2") {
              flagPass = false;
              showAlertInfo("fail","取消发票申请失败！","取消发票申请操作仅适用于对发票状态为“已申请”状态的订单！");
              return false;
            }
            if(recordCount[0].invoiceCode != val.invoiceCode) {
              flagPass = false;
              showAlertInfo("fail","所选订单分属多张发票，请重新选择！");
              return false;
            }
          });
          if(flagPass) {
            getDetailInvoice(recordCount[0].invoiceCode);
            $("#cancelApplyInvoice").show();
          }
        }
        // 确定取消发票申请
        $("#cancelApplyInvoice").click(function() {
          $.ajax({
            url: ctx+'/invoice/pxFinanceInvoiceCtrl/cancelInvoiceApply.do',
            type: 'post',
            dataType: 'json',
            data: {invoiceCode: $(this).attr("dataCode")},
            beforeSend: function() {
              showLoading();
            },
            complete:function() {
              closeLoading();
            },
            success:function(res) {
              if(res.result==0) {
                showAlertInfo("fail",res.msg);
              } else {
                grid_detailsinfo.refresh(true);
                $("#invoiceDetailModal").modal("hide");
                showAlertInfo("success",res.msg);
              }
            }
          });
          
        });

        // 点击发票申请  by zhucaiyun
        function applyInvoice() {
          var recordCount = grid_detailsinfo.getCheckedRecords().length;
          if(recordCount == 0 ) {
            return showAlertInfo("fail","请至少选择一条记录！");
          }
          // 置空 申请发票的订单的信息在表格中
          var getBillsCon = "";
          var flagPass = true;
          var getBillCodes = [];
          var getStuCodes = "";
          var getStuName = "";
          var actMoney = 0;
          /*
          * 所有订单中只能包含一个学员
          * 所有订单的发票状态为未开票
          */ 
          $.each(grid_detailsinfo.getCheckedRecords(), function(index, val) {
            if(grid_detailsinfo.getCheckedRecords()[0].SN != val.SN) {
              flagPass = false;
              showAlertInfo("fail","所选条目中包含多个学员订单，请重新选择！");
              return false;
            }
            if(val.invoiceStatus!="1") {
              flagPass = false;
              showAlertInfo("fail","所选条目中包含非“未开票”状态订单，请重新选择！");
              return false;
            }
            if(+val.PM == 0) {
              flagPass = false;
              showAlertInfo("fail","所选条目中包含0元订单，请重新选择！");
              return false;
            }

            // 填充订单信息表格
            getBillsCon += '<tr>'+
                            '<td>'+val.A+'</td>'+
                            '<td class="hidden-xs">'+(val.CA||"")+'</td>'+
                            '<td class="hidden-sm hidden-xs">'+(val.PM)+'</td>'+ //实付金额是已付款
                          '</tr>';
            // 获取选中的订单编码
            getBillCodes.push(val.A);
            getStuCodes = val.stuCode;
            getStuName = val.StuN;
            actMoney = actMoney +(val.PM.replace(/,/g,"")-0); //实付金额
          });
          // 校验是否是退费中的，如果是那么就提示不让申请发票
          if(flagPass) {
            $.ajax({
              url: ctx+'/invoice/pxFinanceInvoiceCtrl/checkOrderIsRefunding.do',
              type: 'post',
              dataType: 'json',
              async: false,
              data: {studentRegisterCodes: String(getBillCodes)},
              beforeSend: function() {
                showLoading();
              },
              complete:function() {
                closeLoading();
              },
              success:function(res) {
                if(res.result == "0") {
                  showAlertInfo("fail","申请开具发票失败","当前订单有退费正在执行中,请待退费完成后再申请发票！");
                } else {
                  $("#applyInfoForm")[0].reset();
                  $(".personalCon,.companyCon").hide();
                  $("#invoiceNum").val(actMoney);
                  $("#invoiceNum").attr('dataNum', actMoney);
                  $("#invoiceApplyBillInfo").html(getBillsCon); //弹框上部的订单信息表展示
                  $("#inPenName").text(getStuName);
                  $("#applyInvoiceModal").modal("show");
                  $("#confirmApplyInvoice").attr({
                    dataBillCodes: String(getBillCodes),
                    dataStuCodes:getStuCodes
                  });
                }
              }
            })
          }
        }

        $("#applyInvoiceModal").on('hidden.bs.modal', function () {
          $("#normalLi").addClass('active').siblings().removeClass('active');
          $("#VATNormalIn").addClass('active').siblings().removeClass('active');
        })

        /*
        * 申请发票 中点击radio的交互
         */
        $("input[name='applyRole']").click(function() {
          if($(this).val()=="1") {
            $(".personalCon").show();
            $(".companyCon").hide();
          } else {
            $(".companyCon").show();
            $(".personalCon").hide();
            $("#compName,#inCode").val("");
          }
        });
        // 点击发票类型时
        $("#normalLi").click(function() {
          $("#VATProfIn").find('input').val("");
        });
        $("#profesLi").click(function() {
          $("input[name='applyRole']").prop('checked', false);
          $(".personalCon,.companyCon").hide();
          $("#compName,#inCode").val("");
        });
        // 点击提交申请
        $("#confirmApplyInvoice").click(function() {
          var getActNum = Number($("#invoiceNum").val()).toFixed(2);
          var getFlag = true;
          // 进行表单验证
          
          if(isNaN(getActNum)||getActNum<0||getActNum == 0||getActNum>Number($("#invoiceNum").attr("dataNum"))) {
            showAlertInfo("fail","申请发票金额不符合要求！","请输入大于0且不超过实付金额的数字！");
            getFlag = false;
            return false;
          }

          // 如果是增值税普通发票
          if($("#normalLi").hasClass('active')) {
            if(!$("input[name='applyRole']:checked").val()) {
              showAlertInfo("fail","请选择发票抬头属性！");
              getFlag = false;
              return false;
            }
            // 如果选择的是单位
            if($("#company").prop("checked")) {
              if(!$("#compName").val()||!$("#inCode").val()) {
                showAlertInfo("fail","请填写单位名称和税号！");
                getFlag = false;
                return false;
              }
            }
          } else {
            $.each($("#VATProfIn").find("input"), function(index, val) {
              if(!$(this).val()) {
                showAlertInfo("fail","请填写增值税专用发票的信息！");
                getFlag = false;
                return false;
              }
            });
          }
          if(getFlag) {
            var saveData = {};
            var getInvoiceType = $("#normalLi").hasClass('active')?"1":"2";
            // dataBillCodes: String(getBillCodes),
            // dataStuCodes:String(getStuCodes)
            saveData.studentRegisterCodes = $(this).attr("dataBillCodes");
            saveData.studentCode = $(this).attr("dataStuCodes");
            saveData.invoiceMoney = Number($("#invoiceNum").val()).toFixed(2);
            saveData.invoiceType = getInvoiceType;
            saveData.invoiceTitle  = $("input[name='applyRole']:checked").val()||"";
            saveData.unitName  = $("#compName").val()||$("#pCompName").val()||$("#inPenName").text();
            saveData.taxNumber = $("#inCode").val()||$("#pCompInNum").val()||"";
            saveData.bankName = $("#pBankName").val()||"";
            saveData.account = $("#pBankAccount").val()||"";
            saveData.address = $("#pCompAdd").val()||"";
            saveData.phone = $("#pComPhone").val()||"";
            saveData.memo = $("#memoApplyInfo").val()||"";
            // 进行保存
            $.ajax({
              url: ctx+'/invoice/pxFinanceInvoiceCtrl/invoiceApply.do',
              type: 'post',
              dataType: 'json',
              data: saveData,
              beforeSend: function() {
                showLoading();
              },
              complete:function() {
                closeLoading();
              },
              success:function(res) {
                if(res.result == "0") {
                  return showAlertInfo("fail",res.message);
                } else {
                  $("#applyInvoiceModal").modal("hide");
                  grid_detailsinfo.refresh(true);
                  return showAlertInfo("success",res.message);
                }
              }
            })
          }
          
        });
        // 备注不能超过50个字
        $("#memoApplyInfo").keyup(function() {
          if($(this).val().length>49) {
            $(this).val($(this).val().substring(0, 50));
            showAlertInfo("fail", "备注最多只能输入50个字！");
          }
        });
        // 税号不超过30个字
        $("#pCompInNum,#inCode").keyup(function() {
          if($(this).val().length>30) {
            $(this).val($(this).val().substring(0, 30));
            showAlertInfo("fail", "税号最多只能输入30个字！");
          }
        });

  </script>
</body>
</html>