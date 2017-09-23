<#include "/include/head.ftl">
<!--[if IE 9]>         <html class="no-js lt-ie10"> <![endif]-->
<!--[if gt IE 9]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>发票管理|朴新教育</title>
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">
    <link rel="shortcut icon" href="${ctxResource}/bootstrap/appui/img/favicon.png">
    <link rel="stylesheet" href="${ctxResource}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/plugins-2.6.css">
    <link rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/main-2.6.css">
    <link id="theme-link" rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/themes/social-2.4.css">
    <link rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/themes-2.2.css" id="theme-sign">
    <link rel="stylesheet" href="${ctxResource}/bootstrap/px/css/newDtGrid.css">
    <link rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/style.css">
    <script src="${ctxResource}/bootstrap/appui/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="${ctxResource}/bootstrap/appui/js/plugins/socket.io.js"></script>
    <script src="${ctxResource}/bootstrap/appui/js/vendor/jquery-2.2.0.min.js"></script>
</head>
<body>
<div id="page-wrapper" class="page-loading">
    <!-- 公用页面加载loading -->
    <div class="preloader">
      <div class="inner">
        <div class="preloader-spinner themed-background hidden-lt-ie10"></div>
        <h3 class="text-primary visible-lt-ie10"><strong>Loading..</strong></h3>
      </div>
    </div>
    <div id="page-container" class="header-fixed-top sidebar-visible-lg-full enable-cookies">
        <#include "/layout/left.ftl">
        <div id="main-container">
            <#include "/layout/top.ftl">
            <div id="page-content">
                <div class="content-header">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="header-section">
                                <h1>发票管理</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="block">
                    <!-- <div class="block-title clearfix">
                        <h2>价格方案</h2>
                    </div> -->
                    <div class="form-horizontal for-choose-horizontal">
                      <div class="form-group">
                        <div class="col-md-2">
                          <select id="schoolArea" class="form-control">
                            
                          </select>
                         <!--  -->
                        </div>          
                        <div class="col-md-2">
                          <input class="form-control" id="studentName" type="text" placeholder="学员编码/姓名" value="">
                        </div> 
                        <div class="col-md-2">
                          <select id="invoiceType" class="form-control">
                            <option value="">发票类型</option>
                            <#if invoiceTypes?exists>
                              <#list invoiceTypes?keys as key>
                              <option value="${key}">${invoiceTypes[key]}</option>
                              </#list>
                            </#if>
                          </select>
                        </div> 
                        <div class="col-md-4">
                          <div class="input-group input-daterange" data-date-format="yyyy-mm-dd">
                            <input type="text" id="start_time" class="form-control" name="beginDate" placeholder="申请时间开始">
                            <span class="input-group-addon"><i class="fa fa-chevron-right"></i></span>
                            <input type="text" id="end_time" class="form-control" name="endDate" placeholder="申请时间结束">
                          </div>
                        </div>
                        <div class="col-md-2">
                          <select name="invoice" id="invoice" class="form-control">
                            <option value="">开票状态</option>
                            
                            <#if allInvoiceStatus?exists>
                            <#list allInvoiceStatus?keys as key>
							              <#if key!= "1">
                              <option value="${key}">${allInvoiceStatus[key]}</option>
                            </#if>
                            </#list>
                            </#if>
                          </select>
                        </div> 
                      </div>
                      <div class="form-group">
                        <div class="col-md-2">
                          <button type = "button" class="btn btn-primary" id="search">搜索</button>
                        </div>
                      </div>
                    </div>

                    <div class="for-operate-wrap">
                      <button id="confirmInvo" class="btn btn-info btn-sm">开票确认</button>
                      <button class="btn btn-success btn-sm" id = "cancelInvo">取消开票确认</button>
                      <button class="btn btn-primary btn-sm" id="confirmReturnInvo">发票退回</button>
                      <button class="btn btn-info btn-sm" id="cancelReturnInvo">取消发票退回</button>
                    </div>

                    <div class="earn_quarter">
                        <div id="tb_main_body" class="dt-grid-container"></div>
                        <div id="tb_main_tool" class="dt-grid-toolbar-container"></div>
                    </div> 
                    <div class="for-operate-wrap">
                    </div>
                    <h3>
                      学员订单信息
                    </h3>
                    <div class="earn_quarter">
                      <table class="table table-striped table-borderless table-vcenter">
                        <thead>
                          <tr>
                            <th class="hidden-sm hidden-xs">学员编码</th>
                            <th class="hidden-sm hidden-xs">学员姓名</th>
                            <th class="hidden-sm hidden-xs">订单编号</th>
                            <th class="hidden-sm hidden-xs">班级编号</th>
                            <th class="hidden-sm hidden-xs">付款日期</th>
                            <th class="hidden-sm hidden-xs">实付金额</th>
                          </tr>
                        </thead>
                        <tbody id="invoiceBillInfo">
                          
                        </tbody>
                      </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="modal-history" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h5 class="modal-title"><strong>测试一</strong></h5>
            </div>
            <div class="modal-body">
                <div id="tb_main_body_histoty" class="dt-grid-container"></div>
                <div id="tb_main_tool_histoty" class="dt-grid-toolbar-container"></div>
            </div>
            <div class="modal-footer">
                <!-- <button type="button" class="btn btn-effect-ripple btn-primary">Save</button> -->
                <button type="button" class="btn btn-effect-ripple btn-danger" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script src="${ctxResource}/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctxResource}/bootstrap/appui/js/plugins-2.6.js"></script>
<script src="${ctxResource}/bootstrap/appui/js/app-2.4.js"></script>
<!-- dtGrid -->
<script type="text/javascript" src="${ctxResource}/bootstrap/px/js/jquery.dtGrid.js"></script>
<script type="text/javascript" src="${ctxResource}/bootstrap/px/js/lang/zh-cn.js"></script>
<script src="${ctxResource}/bootstrap/appui/js/publicUse.js"></script>
<script src="${ctxResource}/bootstrap/appui/js/pages/invoiceList.js"></script>
</body>
</html>