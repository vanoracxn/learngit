<#include "/include/head.ftl">
<!--[if IE 9]>         <html class="no-js lt-ie10"> <![endif]-->
<!--[if gt IE 9]><!-->
<html class="no-js">
	<!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<title>教学区管理（机构后勤权限）|朴新教育</title>
		<meta name="robots" content="noindex, nofollow">
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">
		<link rel="shortcut icon" href="${ctxResource}/bootstrap/appui/img/favicon.png">
		<link rel="stylesheet" href="${ctxResource}/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/plugins-2.6.css">
		<link rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/main-2.6.css">
		<link rel="stylesheet" media="screen" href="${ctxResource}/bootstrap/px/js/validator/css/bootstrapValidator.css">
		<link id="theme-link" rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/themes/social-2.4.css">
		<link rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/themes-2.2.css" id="theme-sign">
		
		<link rel="stylesheet" type="text/css" href="${ctxResource}/bootstrap/px/css/newDtGrid.css" />
		<link rel="stylesheet" type="text/css" href="${ctxResource}/bootstrap/px/css/bootstrap-select.min.css">
		<link rel="stylesheet" href="${ctxResource}/bootstrap/appui/css/style.css">
		<script src="${ctxResource}/bootstrap/appui/js/vendor/modernizr-2.8.3.min.js"></script>
		<script src="${ctxResource}/bootstrap/appui/js/plugins/socket.io.js"></script>
		<script src="${ctxResource}/bootstrap/appui/js/vendor/jquery-2.2.0.min.js"></script>
		<script src="${ctxResource}/js/jquery.formFill.js"></script>
		<script type="text/javascript" src="${ctxResource}/bootstrap/px/js/jquery.form.js"></script>
		<style>
			.m-t-10 {
				margin-top: 10px!important;
			}
			.p-l-0 {
				padding-left: 0!important;
			}
			#cusGroup .radio-inline + .radio-inline,#typeOfBus .radio-inline + .radio-inline {
				margin-left: 0;
			}
			.file {
			  position: absolute;
				top:0;
				filter: alpha(opacity:0);
				opacity: 0;
			}
			.file#importPermitInput,.file#imNotEnterpInput {
				top: 50px;
				left: 236px;
				width: 300px;
			}
			.file#input-import1 {
				width: 380px;
				left: 4px;
			}
			.file#input-import {
				width: 220px;
				left: 16px;
			}
			/*#update-input-import.file {
				width: 280px;
			}*/
			.display-none {
				display: none;
			}
		</style>
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
										<h1>教学区管理</h1>
									</div>
								</div>
							</div>
						</div>
						<div class="block">
							<div class="form-horizontal for-choose-horizontal">
								<div class="form-group">
									<div class="col-md-2">
										<input type="text" value="" class="form-control" id="searchData" placeholder="教学区编码/名称">
									</div>
									<div class="col-md-2">
										<div class="input-daterange" data-date-format="yyyy-mm-dd">
											<input type="text" id="rentDate" class="form-control" name="rentDate" placeholder="首租日期">
										</div>
									</div>
									<!-- change by zhucaiyun 2017/09/09 去除教学点备案-->
									<!-- <div class="col-md-2">
										<select class="form-control" id="teachPointRecord">
											<option value="">教学点备案</option>
											<#if backoffice_record_status?exists>
											<#list backoffice_record_status?keys as key>
											<option value="${key}">${backoffice_record_status[key]}</option>
											</#list>
											</#if>
										</select>
									</div> -->
									<div class="col-md-2">
										<select class="form-control" id="fireFiling">
											<option value="">消防备案</option>
											<#if backoffice_record_status?exists>
											<#list backoffice_record_status?keys as key>
											<option value="${key}">${backoffice_record_status[key]}</option>
											</#list>
											</#if>
										</select>
									</div>
									<div class="col-md-2">
										<select class="form-control" id="teachStatus">
											<option value="">教学区状态</option>
											<option value="1" selected>启用</option>
											<option value="0">停用</option>
										</select>
									</div>
									<div class="col-md-2">
										<label for="unNormal" class="radio-inline">
											<input type="checkbox" id="unNormal">异常教学区
										</label>
									</div>
									<div class="col-md-2">
										<select class="form-control selectpicker" multiple id="taskType">
											
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-1">
										<button class="btn btn-primary btn-width-default" id = "search">搜索</button>
									</div>
								</div>
								<div class="for-operate-wrap">
									<!-- onclick="toUpdate();" -->
									<button class="btn btn-primary btn-sm btn-effect-ripple" id="editSchArea"><i class="fa fa-plus"></i> 编辑</button>
									<!-- <button class="btn btn-warning btn-sm btn-effect-ripple" id="restManageBtn"><i class="fa fa-plus"></i> 更新教学点备案</button> -->
									<button class="btn btn-success  btn-sm btn-effect-ripple" onclick="enabled();"><i class="fa fa-plus"></i> 启用</button>
									<button class="btn btn-danger btn-sm btn-effect-ripple" onclick="disabledArea();"><i class="fa fa-plus"></i> 停用</button>
								</div>
								<div>
									<div id="tb_main_body" class="dt-grid-container"></div>
									<div id="tb_main_tool" class="dt-grid-toolbar-container"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 添加/修改弹窗 -->
		<!-- <form id='addForm' method="post" action=""> -->
		<div id="addDiv" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalAlertLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content modal-content-px">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="modalTitle">修改教学区</h4>
					</div>
					<div class="modal-body">
						<div class="form-horizontal">
							<div class="form-group">
								<div class="fl col-md-12">
									<div class="col-md-3 control-label"><label>教学区编码</label></div>
									<div class="col-md-7"><input id="code" class="form-control"  type="text" readonly="true" name="code"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="fl col-md-12">
									<div class="col-md-3 control-label"><label>教学区名称<span class="text-danger">*</span></label></div>
									<div class="col-md-7"><input class="form-control"  type="text" name="name"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="fl col-md-12">
									<div class="col-md-3 control-label"><label>负责人</label></div>
									<div class="col-md-7"><input class="form-control" type="text" name="master"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="fl col-md-12">
									<div class="col-md-3 control-label"><label>联系电话</label></div>
									<div class="col-md-7"><input class="form-control"  type="text" name="phone"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="fl col-md-12">
									<div class="col-md-3 control-label"><label>邮编</label></div>
									<div class="col-md-6"><input class="form-control" type="text" name="postCode"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="bottom15 col-md-12">
									<div class="col-md-3 control-label"><label>通讯地址</label></div>
									<div class="col-md-9">
										<textarea class="form-control" name="address"></textarea>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="bottom15 col-md-12">
									<div class="col-md-3 control-label"><label>乘车路线</label></div>
									<div class="col-md-9">
										<textarea class="form-control" name="busRoutes"></textarea>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="fl col-md-12">
									<div class="col-md-3 control-label"><label>总建筑面积（平米）</label></div>
									<div class="col-md-4"><input class="form-control" type="text" name="totalArea" disabled></div>
									<div class="col-md-5">（根据租赁合同面积及汇总）</div>
								</div>
							</div>
							<div class="form-group">
								<div class="fl col-md-12">
									<div class="col-md-3 control-label"><label>租金（元/年）</label></div>
									<div class="col-md-4"><input class="form-control" type="text" name="rentOfYear" disabled></div>
									<div class="col-md-5">（根据租赁合同“理论年租金”汇总）</div>
								</div>
							</div>
							<div class="form-group">
								<div class="fl col-md-12">
									<div class="col-md-3 control-label"><label>首租日期<span class="text-danger">*</span></label></div>
									<div class="col-md-7"><div class="input-group input-daterange" data-date-format="yyyy-mm-dd">
										<input type="text" id="firstRentDate" class="form-control" name="firstRentDate" placeholder="进场时间"> </div></div>
									</div>
								</div>
								<div class="form-group">
									<div class="fl col-md-12">
										<div class="col-md-3 control-label"><label>客户人群<span class="text-danger">*</span></label></div>
										<div class="col-md-7" id="cusGroup"> </div>
									</div>
								</div>
								<div class="form-group">
									<div class="fl col-md-12">
										<div class="col-md-3 control-label"><label>业务类型<span class="text-danger">*</span></label></div>
										<div class="col-md-6" id="typeOfBus"> </div>
									</div>
								</div>
								<div class="form-group">
									<div class="fl col-md-12">
									  <!-- TODO 教学区是否通过教学点备案 change by zhucaiyun 2017/09/09-->
										<div class="col-md-3 control-label"><label>教学区注册及备案情况<span class="text-danger">*</span></label></div>
										<div class="col-md-9">
										  <!-- 办学许可证和民非企业登记证 是否上传选项 -->
										  <label for="isPerSchOrEnterp" class="radio-inline">
										  	<input type="radio" id="isPerSchOrEnterp" name="areaRecordStatus" value="4">办学许可证和民非企业登记证
										  </label>
										</div>

										<!-- 办学许可证信息 判断办学许可证是否展示 isUpdateCert-->
										<div class="col-md-3">
										</div>
										<div class="col-md-9 isUpdateCert">
											<div class="col-md-4 control-label"><label>办学许可证有效期至<span class="text-danger">*</span></label></div>
											<div class="col-md-8 control-label">
												<div class="input-daterange" data-date-format="yyyy-mm-dd">
													<input type="text" id="cerDate" class="form-control" name="cerDate" placeholder="有效期" autocomplete="off">
												</div>
											</div>
											<!-- 上传办学许可证 -->
											<div class="col-md-4 control-label"><label>办学许可证<span class="text-danger">*</span></label></div>
											<div class="up">
												<div class="col-md-5">
													<input type="text" name="newclassfile_xls" id="schPermit" class="form-control" placeholder="限定PDF格式" autocomplete="off">
												</div>
												<input type="button" class="btn btn-default" value="浏览..." autocomplete="off">
												<input type="file" name="schPerFiles" class="file" id="importPermitInput"  onchange="document.getElementById('schPermit').value=this.value" />
												<button type ="submit" class="btn btn-primary" id="importSchPermit">导入</button>
											</div>
											<!-- <div class="col-md-4"></div> -->
											<a class="col-md-5 m-t-10" id="getSchPreFile"></a>
										</div>

										<!-- 非企业登记证有效期-->
										<div class="col-md-3">
										</div>
										<div class="col-md-9 isUpdateCert">
											<div class="col-md-4 control-label"><label>非企业登记证有效期至<span class="text-danger">*</span></label></div>
											<div class="col-md-8 control-label">
												<div class="input-daterange" data-date-format="yyyy-mm-dd">
													<input type="text" id="notCerDate" class="form-control" name="notCerDate" placeholder="有效期" autocomplete="off">
												</div>
											</div>
											<!-- 上传办学许可证 -->
											<div class="col-md-4 control-label"><label>民非企业登记证<span class="text-danger">*</span></label></div>
											<div class="up">
												<div class="col-md-5">
													<input type="text" name="newclassfile_xls" id="notEnterPresePermit" class="form-control" placeholder="限定PDF格式" autocomplete="off">
												</div>
												<input type="button" class="btn btn-default" value="浏览..." autocomplete="off">
												<input type="file" name="schPerFiles" class="file" id="imNotEnterpInput"  onchange="document.getElementById('notEnterPresePermit').value=this.value" />
												<button type ="submit" class="btn btn-primary" id="importNoEnterpPermit">导入</button>
											</div>
											<!-- <div class="col-md-4"></div> -->
											<a class="col-md-5 m-t-10" id="getNoEnterPreFile"></a>
										</div>

										<!-- 已备案 ，未备案，备案中 -->
                    <!-- 已备案 -->
										<div class="col-md-3"></div>
										<div class="col-md-9">
											<label for="backed" class="radio-inline">
												<input type="radio" id="backed" name="areaRecordStatus" value="3">教学点已备案
											</label>
										</div>
										<!-- ishide 已备案状态判断有效期，上传备案资料是否显示 -->
										<div class="col-md-3 m-t-10 is-hide"></div>
										<div class="col-md-9 m-t-10 is-hide">
											<div class="col-md-4 control-label"><label>有效期至<span class="text-danger">*</span></label></div>
											<div class="col-md-6">
											  <div class="input-daterange" data-date-format="yyyy-mm-dd">
													<input type="text" id="validDate" class="form-control" name="validDate" placeholder="有效期"> 
												</div>
											</div>
										</div>
										<!-- 已备案信息 -->
										<div class="col-md-3 m-t-10 is-hide"></div>
										<div class="col-md-9 m-t-10 is-hide filinged">
											<div class="col-md-4 control-label"><label>教学点备案附件<span class="text-danger">*</span></label></div>
											<div class="col-md-8">
												<div class="up">
													<div class="col-md-5 p-l-0">
														<input type='text' name='newclassfile_xls' id='textfield' class="form-control" placeholder="限定PDF格式" />
													</div>
													<input type='button' class='btn btn-default' value='浏览...' />
													<input type="file" name="areaRecordPath" class="file" id="input-import"  onchange="document.getElementById('textfield').value=this.value" />
													<button type ="submit" class="btn btn-primary" id="btn-import">导入</button>
												</div>
											</div>
											<!-- <div class="col-md-6"></div> -->
											<a class="col-md-6 m-t-10" id="getAreaFile"></a>
										</div>

										<!-- 备案中 -->
										<div class="col-md-3"></div>
										<div class="col-md-9">
											<label for="backing" class="radio-inline">
												<input type="radio" id="backing" name="areaRecordStatus" value="2">备案中
											</label>
										</div>
									
										<div class="col-md-3 m-t-10 filing"></div>
										<div class="col-md-9 m-t-10 filing">
										  <div class="col-md-4 control-label"><label>备案中原因<span class="text-danger">*</span></label></div>
										  <div class="col-md-8">
											  <textarea id="Filing" class="form-control" placeholder="请填备案中原因"></textarea>
										  </div>
										</div>

										<div class="col-md-3"></div>
										<div class="col-md-9">
											<label for="noBack" class="radio-inline">
												<input type="radio" id="noBack" name="areaRecordStatus" value="1">未备案
											</label>
										</div>
										<!-- 未备案原因 nofiling -->
										<div class="col-md-3 m-t-10 no-filing"></div>
										<div class="col-md-9 m-t-10 no-filing">
											<div class="col-md-4 control-label"><label>未备案原因<span class="text-danger">*</span></label></div>
											<div class="col-md-8">
												<textarea id="noFiling" class="form-control" placeholder="请填写未备案原因"></textarea>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="fl col-md-12">
										<div class="col-md-3 control-label"><label>教学区是否通过消防备案<span class="text-danger">*</span></label></div>
										<div class="col-md-9">
											<label for="fireNoBack" class="radio-inline">
												<input type="radio" id="fireNoBack" name="fireControlRecordStatus" value="1">未备案
											</label>
											<label for="fireBacking" class="radio-inline">
												<input type="radio" id="fireBacking" name="fireControlRecordStatus" value="2">备案中
											</label>
											<label for="fireBacked" class="radio-inline">
												<input type="radio" id="fireBacked" name="fireControlRecordStatus" value="3">已备案
											</label>
										</div>
									</div>	
									<div class="col-md-12 fire-is-hide ">
										<div class="col-md-3 control-label"><label>消防备案附件<span class="text-danger">*</span></label></div>
										<div class="col-md-9">
											<div class="up">
												<div class="col-md-6 p-l-0">
													<input type='text' name='newclassfile_xls' id='textfield1' class="form-control" placeholder="限定PDF格式"/>
												</div>
												<input type='button' class='btn btn-default' value='浏览...' />
												<input type="file" name="fireControlRecordPath" class="file" id="input-import1"  onchange="document.getElementById('textfield1').value=this.value" />
												<button type="submit" class="btn btn-primary" id="btn-import1">导入</button>
											</div>
										</div>
										<!-- <div class="col-md-3"></div> -->
										<a class="col-md-6 m-t-10" id="getFireFile"></a>
									</div>
									<!-- 备案中状态 -->
									<div class="col-md-12 fire-baking">
										<div class="col-md-3 control-label"><label>备案中原因<span class="text-danger">*</span></label></div>
										<div class="col-md-9">
											<textarea id="fireBackingTextarea" class="form-control" placeholder="请填写备案中原因"></textarea>
										</div>
									</div>
									<!-- 未备案状态 -->
									<div class="col-md-12 fire-no-bake">
										<div class="col-md-3 control-label"><label>未备案原因<span class="text-danger">*</span></label></div>
										<div class="col-md-9">
											<textarea id="fireNoBackTextarea" class="form-control" placeholder="请填写未备案原因"></textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="confirmAddTea">确认</button>
								<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">取消</button>
							</div>
						</div>
					</div>
				</div>
						<!-- </form> -->
						<!-- 2017/09/09  change by -->
						<div id="updateAreaFile" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										<h5 class="modal-title">更新教学点备案</h5>
									</div>
									<div class="modal-body form-horizontal">
										<div class="form-group">
											<div class="col-md-3 control-label"><span>有效期至</span></div>
											<div class="col-md-6">
												<div class="input-daterange" data-date-format="yyyy-mm-dd">
													<input type="text" id="updateValidDate" class="form-control" name="updateValidDate" placeholder="有效期">
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3 control-label"><span>教学点备案附件</span></div>
											<div class="col-md-9">
												<div class="up">
													<div class="col-md-6 p-l-0">
														<input type='text' name='updateNewclassfile_xls' id='updateTextfield' class="form-control"/>
													</div>
													<input type='button' class='btn btn-default' value='浏览...' />
													<input type="file" name="updateAreaRecordPath" class="file" id="update-input-import"  onchange="document.getElementById('updateTextfield').value=this.value" />
													<label class="radio-line text-danger">请上传PDF格式附件</label>
													<!-- <button type ="submit" class="btn btn-primary" id="btn-import">导入</button> -->
												</div>
											</div>
											<div class="col-md-3"></div>
											<a class="col-md-6 m-t-10" id="getUpdateAreaFile"></a>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-effect-ripple btn-primary" id="confirmUpdateFile">上传</button>
										<button type="button" class="btn btn-effect-ripple btn-danger" data-dismiss="modal">关闭</button>
									</div>
								</div>
							</div>
						</div>
						<script src="${ctxResource}/bootstrap/js/bootstrap.min.js"></script>
						<script type="text/javascript" src="${ctxResource}/bootstrap/appui/js/plugins-2.6.js"></script>
						<script type="text/javascript" src="${ctxResource}/bootstrap/appui/js/app-2.4.js"></script>
						<script type="text/javascript" src="${ctxResource}/bootstrap/px/js/validator/js/bootstrapValidator.js"></script>
						<script type="text/javascript" src="${ctxResource}/bootstrap/px/js/jquery.dtGrid.js"></script>
						<script type="text/javascript" src="${ctxResource}/bootstrap/px/js/lang/zh-cn.js"></script>
						<script type="text/javascript" src="${ctxResource}/bootstrap/px/js/pagerJs.js"></script>
						<script type="text/javascript" src="${ctxResource}/bootstrap/px/js/bootstrap-select.min.js"></script>
						<script src="${ctxResource}/bootstrap/appui/js/publicUse.js"></script>
						<script type="text/javascript">
						$(function(){
							chargeVerify.initTable();
							// 添加业务类型和客户人群
							// 客户人群展示内容
							$.ajax({
								url: ctx+'/backoffice/baseInfo/BaseInfoManageCtrl/getCustomerGroup',
								type: 'post',
								dataType: 'json',
								async: false,
								success:function(data) {
									var content = "";
									$.each(data.customerGroup,function(index, el) {
										content +='<label for="custClass'+index+'" class="radio-inline">'+
															'<input type="checkbox" id="custClass'+index+'" value="'+el.code+'">'+el.name+
													    '</label>';
									});
									$("#cusGroup").html(content);
								}
							});

							// 业务类型
							$.ajax({
								url: ctx+'/backoffice/baseInfo/BaseInfoManageCtrl/getAreaTypeCode',
								type: 'post',
								dataType: 'json',
								success:function(data) {
									var selectContent = "";
									var checkContent = "";
									$.each(data.typeCode, function(index, el) {
										checkContent +='<label for="busType'+index+'" class="radio-inline">'+
															'<input type="checkbox" id="busType'+index+'" value="'+el.code+'">'+el.name+
													'</label>';
												selectContent +='<option value="'+el.code+'">'+el.name+'</option>';
									});
									$("#typeOfBus").html(checkContent);
									$("#taskType").html(selectContent);
									$('.selectpicker').selectpicker({
										'noneSelectedText': '业务类型'
									});
								}
							})
						
							// 点击客户人群中的纯总部办公时会其它不能选
							$("#cusGroup").on('click', 'input[type="checkbox"]', function() {
								if($(this).val()=="07"&&$(this).prop("checked")) {
									$(this).parent().siblings('label').children("input").prop('checked', false).attr("disabled",true);
								} else if($(this).val()=="07"&&!$(this).prop("checked")) {
									$(this).parent().siblings('label').children("input").removeAttr('disabled');
								}
							});

						  // 保存
							$("#confirmAddTea").click(function() {
								// 获取业务类型，客户人群选中的值
								var getCusArr = [];
								var getBusArr = [];
								$.each($("#cusGroup").find("input[type='checkbox']"), function(index, el) {
									if ($(this).prop("checked")) {
										getCusArr.push($(this).val());
									}
								});
								$.each($("#typeOfBus").find("input[type='checkbox']"), function(index, el) {
									if ($(this).prop("checked")) {
										getBusArr.push($(this).val());
									}
								});
								getCusArr = String(getCusArr);
								getBusArr = String(getBusArr);

								// 进行必填项验证
								if (!$("input[name='name']").val() || !$("#firstRentDate").val() || !getCusArr || !getBusArr || !$("input[name='fireControlRecordStatus']:checked").val() || !$("input[name='areaRecordStatus']:checked").val()) {
									return showAlertInfo("fail", "带星号的为必填项,请填写全信息！");
								}

								// 如果选择办学许可证和民非企业登记证 那么该下面的信息应都填写 验证
								if($("#isPerSchOrEnterp").prop("checked")) {
									if(!$("#cerDate").val()||!$("#notCerDate").val()) {
										return showAlertInfo("fail","有效期不能为空！");
									}
									if(!$("#getNoEnterPreFile").text()||!$("#getSchPreFile").text()) {
										return showAlertInfo("fail","请上传有效证件！");
									}
								// 教学点备案选中
								} else {
									// 未备案状态
									if($("#noBack").prop("checked")) {
										if(!$("#noFiling").val()) {
											return  showAlertInfo("fail","未备案原因不能为空！");
										} 
									// 备案中
									} else if($("#backing").prop("checked")){
										if(!$("#Filing").val()) {
											return  showAlertInfo("fail","备案中原因不能为空！");
										}
									} 
									// 已备案
									else if($("#backed").prop("checked")) {
										if(!$("#validDate").val()) {
											return showAlertInfo("fail","有效期不能为空！");
										} 
										if(!$("#getAreaFile").text()) {
											return showAlertInfo("fail","请上传教学点附件文件！");
										}
									// 没有备案状态
									} else {
										return showAlertInfo("fail","请选择教学点备案状态！");
									}
								}

                // 已备案状态
								if ($("#fireBacked").prop("checked")) {
									if (!$("#getFireFile").text()) {
										return showAlertInfo("fail", "消防备案在已备案状态下必须上传消防备案附件！");
									}
								}
								// 消防未备案状态判断是否填写了未备案原因
								if($("#fireNoBack").prop("checked")) {
									if(!$("#fireNoBackTextarea").val()) {
										return showAlertInfo("fail","消防备案在未备案状态下必须填写未备案原因！")
									}
								}
								// 消防备案中状态
								if($("#fireBacking").prop("checked")) {
									if(!$("#fireBackingTextarea").val()) {
										return showAlertInfo("fail","消防备案在备案中状态下必须填写备案中原因！")
									}
 								}
							  // var getPermitSchoStatus  = $("#isPerSchOrEnterp").prop("checked")?"1":"0";
							  // var getTeachStatus   = $("#isTeachFilings").prop("checked")?"1":"0";

								// 获取参数
								var getParam = {
									code: $("input[name='code']").val()||"",
									name: $("input[name='name']").val()||"",
									master: $("input[name='master']").val()||"",
									phone: $("input[name='phone']").val()||"",
									postCode: $("input[name='postCode']").val()||"",
									address: $("textarea[name='address']").val()||"",
									busRoutes: $("textarea[name='busRoutes']").val()||"",
									firstRentDate: $("input[name='firstRentDate']").val().replace(/-/g, ""),
									customerGroup: getCusArr,
									typeCode: getBusArr,
									// permitSchoolNonEnterpriseStatus : getPermitSchoStatus,
									// teachingPointRecordStatus: getTeachStatus,
									permitSchoolValidDate: $("#cerDate").val().replace(/-/g, "")||"",
									nonEnterpriseValidDate: $("#notCerDate").val().replace(/-/g, "")||"",
									validDate: $("input[name='validDate']").val().replace(/-/g, "")||"",
									fireControlRecordStatus: $("input[name='fireControlRecordStatus']:checked").val() || "",
									areaRecordStatus: $("input[name='areaRecordStatus']:checked").val()||"",
									noRecordReason: $("#noFiling").val()||"",
									fireControlNoRecordReason: $("#fireNoBackTextarea").val()||"",
									fireControlInRecordingReason: $("#fireBackingTextarea").val()||"",
									inRecordingReason: $("#Filing").val()||"",

								};
								$.ajax({
									url: ctx + '/backoffice/baseInfo/BaseInfoManageCtrl/saveBackofficeArea.do',
									type: 'post',
									dataType: 'json',
									data: getParam,
									success: function(data) {
										grid.refresh(true);
										if (data.result == 1) {
											showAlertInfo("success", "保存成功");
											grid.refresh(true);
										} else {
											showAlertInfo("fail", data.message);
										}
										$("#addDiv").modal("hide");
									},
									beforeSend: function(data) {
										showLoading();
									}
								});
							});
						});

						// 上传pdf文件的函数
            function importPdf(fileId,flag,formId,showFileId,getEffectDate) {
            	if ($('#'+fileId).val() != "") {
            		// 上传文件大小不能超过5M
            		var file = document.getElementById(fileId).files;
            		if (file[0].size > 5242880) {
            			return showAlertInfo("fail", "上传文件大小不能大于5M");
            		}
            	var getValid;
              if(getEffectDate) {
            		getValid = $("#"+getEffectDate).val().replace(/-/g, "") || "";
              } else {
              	getValid = "";
              }
							var getCode = $("input[name='code']").val();
							var getUploadUrl = '${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/uploadContractPDF.do?flag='+flag+'&code=' + getCode + '&validDate=' + getValid;
            		if (!$('#'+fileId).parent('form').hasClass('flag-attr')) {
            			$('#'+fileId).wrap("<form id='"+formId+"' class='flag-attr' style='display:inline-block' method='post' enctype='multipart/form-data'></form>");
            		}
            		$("#"+formId).attr('action', getUploadUrl);
            		$('#'+formId).ajaxSubmit({
            			dataType: 'json',
            			beforeSend: function() {
            				showLoading();
            			},
            			complete: function(xhr, status) {
            				closeLoading();
            				if (xhr.status === 'timeout') {
            					location.reload();
            				}
            		
            			},
            			success: function(data) {
            			
            				if (data.code === "2") {
            					showAlertInfo("fail", "导入失败!", data.message || '');
            				} else if (data.code === "1") {
            					$("#"+showFileId).text(data.obj.fileName);
            					showAlertInfo("success", "导入成功！");
            				} else if (data.code === "0") {
            					showAlertInfo("fail", "导入失败!", data.message || '');
            				} else {
            					showAlertInfo("fail", "导入失败！");
            				}
            			}
            		});
            	} else {
            		showAlertInfo("fail", "请选择上传文件");
            	}
            }
            
						//更新教材备案
						$("#restManageBtn").click(function() {
							var checkCount = grid.getCheckedRecords();
							if(checkCount.length !==1) {
								return showAlertInfo("fail","只能选择一条信息！");
							}
							// .substring(0,4)+"-"+checkCount[0].validDate.substring(4,6)+"-"+checkCount[0].validDate.substring(6,8)
							var getValiDates = checkCount[0].validDate?checkCount[0].validDate:"";
							var getFileName = checkCount[0].areaRecordName?checkCount[0].areaRecordName:false;
							$("#updateValidDate").val(getValiDates);
							// 第二次改的日期必须大于第一次的日期，所以setstartdate
							if(getValiDates) {
								$('#updateValidDate').datepicker('setStartDate', getValiDates);
							} else {
								$('#updateValidDate').datepicker('setDate', "");
								$('#updateValidDate').datepicker('setStartDate', "");
							}
							$("#updateTextfield").val("");
							if(getFileName) {
								$("#confirmUpdateFile").text("重新上传");
								$("#getUpdateAreaFile").text(getFileName).attr('href', '${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/downloadContractPDF.do?flag=areabak.pdf&fileRealName='+checkCount[0].areaRecordPath+'&fileName='+checkCount[0].areaRecordName);;
							} else {
								$("#confirmUpdateFile").text("上传");
								$("#getUpdateAreaFile").text("");
							}
							
							$("#confirmUpdateFile").attr('data-code', checkCount[0].code);
							$("#updateAreaFile").modal();
						});
						// 更新教材备案附件
						$("#confirmUpdateFile").click(function() {
							if (!$("#updateValidDate").val()) {
								return showAlertInfo("fail", "请先填写有效期！")
							}
							if ($('#update-input-import').val() != "") {
								var fileUpdate = document.getElementById("update-input-import").files;
								if (fileUpdate[0].size > 5242880) {
									return showAlertInfo("fail", "上传文件大小不能大于5M");
								}
								var getValid = $("#updateValidDate").val().replace(/-/g, "") || "";
								var getCode = $(this).attr("data-code");
								var getUploadUrl = '${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/uploadContractPDF.do?flag=areabak.pdf&code=' + getCode + '&validDate=' + getValid;
								// 如果已经由form了就不在wrapform了
								if (!$("#update-input-import").parent("form").hasClass('flag-attr')) {
									$('#update-input-import').wrap("<form id='updateMyupload' class='flag-attr' style='display:inline-block' method='post' enctype='multipart/form-data'></form>");
								}
								$("#updateMyupload").attr('action', getUploadUrl);

								$('#updateMyupload').ajaxSubmit({
									dataType: 'json',
									beforeSend: function() {
										showLoading();
									},
									complete: function(xhr, status) {
										closeLoading();
										if (xhr.status === 'timeout') {
											location.reload();
										}
										$('#update-input-import').unwrap("<form id='updateMyupload' class='flag-attr' style='display:inline-block' method='post' enctype='multipart/form-data'></form>");
									},
									success: function(data) {
										closeLoading();
										grid.refresh(true);
										$('#update-input-import').unwrap("<form id='updateMyupload' class='flag-attr' style='display:inline-block' method='post' enctype='multipart/form-data'></form>");
										if (data.code == "2") {
											$("#updateAreaFile").modal("hide");
											return showAlertInfo("fail", "导入失败!", data.message || '');
										} else if (data.code == "1") {
											$("#updateAreaFile").modal("hide");
											$("#getAreaFile").text(data.obj.fileName);
											return showAlertInfo("success", "导入成功!");
										} else if (data.code == "0") {
											$("#updateAreaFile").modal("hide");
											return showAlertInfo("fail", "导入失败!", data.message || '');
										} else {
											$("#updateAreaFile").modal("hide");
											return showAlertInfo("fail", "导入失败!");
										}
									}
								});
							} else {
								closeLoading();
								$("#updateAreaFile").modal("hide");
								return showAlertInfo("error", "请选择上传文件");
							}
						});
         
						// 点击编辑 初始化form表单 关于初始状态的 mf
						$("#editSchArea").click(function() {
							// 上传的input设置为空 初始化消防教学点备案和证书教学点备案
							$("#input-import,#textfield,#importPermitInput,#schPermit,#imNotEnterpInput,#notEnterPresePermit,#input-import1,#textfield1,#cerDate,#notCerDate,#validDate,#fireNoBackTextarea,#fireBackingTextarea,#Filing").val("");
							$("#getFireFile,#getAreaFile,#getNoEnterPreFile,#getSchPreFile").text("");
							// 
							$("#isPerSchOrEnterp,#backed,#noBack,#backing").prop("checked",false);
							$(".isUpdateCert,.isFilingsShow,.is-hide,.filing,.no-filing,.fire-is-hide,.fire-no-bake,.fire-baking").addClass("display-none");

							var checkCount = grid.getCheckedRecords();
							var checkCount_length = checkCount.length;
							if (checkCount_length !== 1) {
								return showAlertInfo("fail", "请选择一个教学区");
							}
							$("#modalTitle").html("修改教学区");
							var sdata = {
								"code": checkCount[0].code
							};
							$.ajax({
								type: "POST",
								url: "${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/queryOneAreaForBackoffice",
								data: sdata,
								dataType: "json",
								success: function(msg) {
									// 首租日期
									var firstRent = msg.firstRentDate ? (msg.firstRentDate.substring(0, 4) + "-" + msg.firstRentDate.substring(4, 6) + "-" + msg.firstRentDate.substring(6, 8)) : "";
									// 客户人群
									var getCustomerArr = msg.customerGroup?msg.customerGroup.split(","):[];
									if (getCustomerArr.indexOf("07") !== -1) {
										$("#cusGroup").find($("input[value='07']")).parent("label").siblings('label').children("input").attr("disabled", true);
									} else {
										$("#cusGroup").find("input[type='checkbox']").removeAttr('disabled');
									}
									$.each($("#cusGroup").find("input[type='checkbox']"), function(index, el) {
										if (getCustomerArr.indexOf($(this).val()) !== -1) {
											$(this).prop("checked", true);
										} else {
											$(this).prop('checked', false);
										}
									});

									// 业务类型
									var getTypeCodeArr =  msg.typeCode?msg.typeCode.split(","):[];
									$.each($("#typeOfBus").find("input[type='checkbox']"), function(index, el) {
										if (getTypeCodeArr.indexOf($(this).val()) !== -1) {
											$(this).prop('checked', true);
										} else {
											$(this).prop("checked", false);
										}
									});

									// 教学区注册及备案情况  
									/*
									* 首先判断是选择证书还是备案
									* 如果是证书 教学备案隐藏，且里面都置空 证书里需要填写日期，证件地址
									* 如果是备案，证书置空且隐藏，填写日期，备案里判断是什么状态，
									 */
									// 办学许可证和民非企业登记证 状态下
									if(msg.areaRecordStatus == "4") {
										$("#isPerSchOrEnterp").prop("checked",true);
										$("#isPerSchOrEnterp").click(); 
										// 办学许可证 有效期填充
										if(msg.permitSchoolValidDate) {
											$("#cerDate").val((msg.permitSchoolValidDate).substring(0, 4) + "-" + (msg.permitSchoolValidDate).substring(4, 6) + "-" + (msg.permitSchoolValidDate).substring(6, 8));
										} else {$("#cerDate").val("");}
										// 办学许可证 文件内容填充
										if (msg.permitSchoolFileName) {
											$("#getSchPreFile").attr("href", "${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/downloadContractPDF.do?flag=permitschool.pdf&fileRealName=" + msg.permitSchoolFilePath + "&fileName=" + msg.permitSchoolFileName);
										}
										$("#getSchPreFile").text(msg.permitSchoolFileName || '');

										// 非民企业内容
										if(msg.nonEnterpriseValidDate) {
											$("#notCerDate").val((msg.nonEnterpriseValidDate).substring(0, 4) + "-" + (msg.nonEnterpriseValidDate).substring(4, 6) + "-" + (msg.nonEnterpriseValidDate).substring(6, 8));
										} else {$("#notCerDate").val("");}
										// 非民企业 文件内容填充
										if (msg.nonEnterpriseFileName) {
											$("#getNoEnterPreFile").attr("href", "${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/downloadContractPDF.do?flag=nonenterprise.pdf&fileRealName=" + msg.nonEnterpriseFilePath + "&fileName=" + msg.nonEnterpriseFileName);
										}
										$("#getNoEnterPreFile").text(msg.nonEnterpriseFileName || '');

                  // 教学点备案 状态
 									} else if(msg.areaRecordStatus == "1") {
										$("#noBack").click()
										$("#noFiling").val(msg.noRecordReason||"");
									} else if(msg.areaRecordStatus == "2") {
										$("#backing").click();
										$("#Filing").val(msg.inRecordingReason||"");
									} else if(msg.areaRecordStatus == "3"){
										$("#backed").click();
										if (msg.areaRecordName) {
											$("#getAreaFile").attr("href", "${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/downloadContractPDF.do?flag=areabak.pdf&fileRealName=" + msg.areaRecordPath + "&fileName=" + msg.areaRecordName);
										}
										$("#getAreaFile").text(msg.areaRecordName || '');
										if(msg.validDate) {
											$("#validDate").val((msg.validDate).substring(0, 4) + "-" + (msg.validDate).substring(4, 6) + "-" + (msg.validDate).substring(6, 8))
										}
									} else {
										$("input[name='areaRecordStatus']").prop("checked",false);
									}
                  
                  // 消防状态同教案的一样
									var getFireStatus = msg.fireControlRecordStatus ? msg.fireControlRecordStatus.split(",") : "";
									if (getFireStatus == "3") {
										// ,.fire-no-bake
										$(".fire-is-hide").removeClass('display-none');
										if (msg.fireControlRecordName) {
											$("#getFireFile").attr("href", "${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/downloadContractPDF.do?flag=firerecord.pdf&fileRealName=" + msg.fireControlRecordPath + "&fileName=" + msg.fireControlRecordName)
										}
										$("#getFireFile").text(msg.fireControlRecordName || '');
									} else if(getFireStatus == "1") {
										$(".fire-no-bake").removeClass('display-none');
										$("#fireNoBackTextarea").val(msg.fireControlNoRecordReason);
									} else if(getFireStatus == "2"){
										$(".fire-baking").removeClass('display-none');
										$("#fireBackingTextarea").val(msg.fireControlInRecordingReason);
									} else {
										$(".fire-is-hide,.fire-no-bake,.fire-baking").addClass('display-none');
										$("#input-import1,#textfield1,#fireNoBackTextarea,#fireBackingTextarea").val("");
									}

									if (getFireStatus) {
										$("input[name='fireControlRecordStatus'][value=" + getFireStatus + "]").prop('checked', true);
									} else {
										$("input[name='fireControlRecordStatus']:checked").prop('checked',false);
									}

									// 填充数据
									$("input[name='code']").val(msg.code || '');
									$("input[name='name']").val(msg.name || '');
									$("input[name='master']").val(msg.master || '');
									$("input[name='phone']").val(msg.phone || '');
									$("input[name='postCode']").val(msg.postCode || '');
									$("textarea[name='address']").val(msg.address || '');
									$("textarea[name='busRoutes']").val(msg.busRoutes || '');
									$("input[name='totalArea']").val(msg.totalArea || '');
									$("input[name='rentOfYear']").val(msg.rentOfYear || '');
									$("input[name='firstRentDate']").val(firstRent);
									// $("input[name='validDate']").val(showValiDate);
									
									
									$('#addDiv').modal();
								}
							});
						});
            /*
            * 教学区注册及备案情况 中办学许可证和民非企业登记证和教学点备案更改
            * 显示隐藏的操作
             */
      //       $("input[name='cerAndFilings']").click(function() {
      //       	// 选中备案 另一个的内容置空，and 隐藏
						// 	if ($("input[name='cerAndFilings']:checked").val() == "filingsVal") {
						// 		  $("#cerDate,#importPermitInput,#schPermit,#notEnterPresePermit,#notCerDate,#imNotEnterpInput").val("");
						// 		  $(".isFilingsShow").removeClass('display-none');
						// 			$(".isUpdateCert").addClass("display-none");
						// 	// 选中证书
						// 	} else {
						// 		$("input[name='areaRecordStatus']").prop("checked",false);
						// 		$("#validDate,#input-import").val("");
						// 		$(".isUpdateCert").removeClass("display-none");
						// 		$(".isFilingsShow,.is-hide,.no-filing,.filing").addClass('display-none');
						// 	}
						// });

						// 教学区是否通过教学点备案 选项改变时
						$("input[name='areaRecordStatus']").click(function() {
							if ($(this).val() == "3") {
								$(".is-hide").removeClass('display-none');
								$(".no-filing,.filing,.isUpdateCert").addClass('display-none');
								$("#noFiling,#Filing,#cerDate,#importPermitInput,#schPermit,#notEnterPresePermit,#notCerDate,#imNotEnterpInput").val("");
							} else if($(this).val() == '1') {
								$(".no-filing").removeClass('display-none');
								$(".is-hide,.filing,.isUpdateCert").addClass('display-none');
								$("#validDate,#input-import,#Filing,#cerDate,#importPermitInput,#schPermit,#notEnterPresePermit,#notCerDate,#imNotEnterpInput").val("");
							} else if($(this).val() == '2') {
								$(".filing").removeClass('display-none');
								$(".is-hide,.no-filing,.isUpdateCert").addClass('display-none');
								$("#validDate,#input-import,#noFiling,#cerDate,#importPermitInput,#schPermit,#notEnterPresePermit,#notCerDate,#imNotEnterpInput").val("");
							} else if($(this).val()=="4") {
								$(".isUpdateCert").removeClass('display-none');
								$(".is-hide,.no-filing,.filing").addClass('display-none');
								$("#validDate,#input-import,#noFiling,#Filing").val("");
							} else {
								$(".is-hide,.no-filing,.filing,.isUpdateCert").addClass('display-none');
								$("#noFiling,#validDate,#input-import,#Filing,#cerDate,#importPermitInput,#schPermit,#notEnterPresePermit,#notCerDate,#imNotEnterpInput").val("");
							}
						});

						// 消防备案 选项改变
						$("input[name='fireControlRecordStatus']").click(function() {
							if ($(this).val() == "3") {
								$(".fire-is-hide").removeClass('display-none');
								$(".fire-baking,.fire-no-bake").addClass('display-none');
								$("#fireBackingTextarea,#fireNoBackTextarea").val("");
							} else if($(this).val() =="2") {
								$(".fire-baking").removeClass('display-none');
								$(".fire-is-hide,.fire-no-bake").addClass('display-none');
								$("#input-import1,#textfield1,#fireNoBackTextarea").val("");
							} else if($(this).val() == "1") {
								$(".fire-no-bake").removeClass('display-none');
								$(".fire-is-hide,.fire-baking").addClass('display-none');
								$("#input-import1,#textfield1,#fireBackingTextarea").val("");
							} else {
								$(".fire-is-hide,.fire-baking").addClass('display-none');
								$("#input-import1,#textfield1,#fireBackingTextarea,#fireNoBackTextarea").val("");
							}
						});

						// 点击导入教学点备案
						$("#btn-import").click(function() {
							importPdf("input-import","areabak.pdf","myupload","getAreaFile","validDate");
						});

						// 点击导入消防备案
						$("#btn-import1").click(function() {
							importPdf("input-import1","firerecord.pdf","myupload1","getFireFile");
						});
						// 点击导入办学许可证
						$("#importSchPermit").click(function() {
							importPdf("importPermitInput","permitschool.pdf","myupload2","getSchPreFile","cerDate");
						});
						// 点击导入民非企业登记证
						$("#importNoEnterpPermit").click(function() {
							importPdf("imNotEnterpInput","nonenterprise.pdf","myupload3","getNoEnterPreFile","notCerDate");
						});

						// 点击启用
						function enabled() {
							var checkCount = grid.getCheckedRecords();
							var checkCount_length = checkCount.length;
							if (checkCount_length == 0) {
								return showAlertInfo("fail", "请至少选择一个教学区");
							}
							var codes = '';
							for (var i = 0; i < checkCount_length; i++) {
								codes += checkCount[i].code + ".";
							}
							var sdata = {
								"codes": codes.substring(0, codes.length - 1)
							};
							$.ajax({
								type: "POST",
								url: "${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/areaEnabled.do",
								data: sdata,
								dataType: "json",
								success: function(msg) {
									if (parseInt(msg.result) == 1) {
										showAlertInfo('success', '启用成功');
										grid.refresh(true);
									} else {
										showAlertInfo('fail', msg.message);
									}
								}
							});
						}

						// 停用
						function disabledArea() {
							var checkCount = grid.getCheckedRecords();
							var checkCount_length = checkCount.length;
							if (checkCount_length == 0) {
								return showAlertInfo("fail", "请至少选择一个教学区");
							}
							var codes = '';
							for (var i = 0; i < checkCount_length; i++) {
								codes += checkCount[i].code + ".";
							}
							var sdata = {
								"codes": codes.substring(0, codes.length - 1)
							};
							$.ajax({
								type: "POST",
								url: "${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/areaDisabled.do",
								data: sdata,
								dataType: "json",
								success: function(msg) {
									if (parseInt(msg.result) == 1) {
										showAlertInfo('success', '停用成功');
										grid.refresh(true);
									} else
										showAlertInfo('fail', msg.message);
								}
							});
						}

						// DTGrid属性
						var chargeVerify = {
							//初始化表格数据
							initTable: function() {
							var tables = {};
							var that = this;
							//定义表格列属性
							tables.dtGridColumns =
							[
								{id: 'code', title: '教学区编码', type: 'string', columnClass: 'text-center'},
								{id: 'name', title: '教学区名称', type: 'string', columnClass: 'text-center'},
								{id: 'totalArea', title: '总建筑面积（平米）', type: 'string', columnClass: 'text-center'},
								{id: 'firstRentDate', title: '首租日期', type: 'string', columnClass: 'text-center'},
								{id: 'customerGroup', title: '客户人群', type: 'string', columnClass: 'text-center', fastQuery: true, fastQueryType: 'lk'},
								{id: 'typeCode', title: '业务类型', type: 'string', columnClass: 'text-center', fastQuery: true,
								fastQueryType: 'lk'},
								{id: 'nonEnterpriseValidDate', title: '民非企业登记证有效期至', type: 'string', columnClass: 'text-center'},

								// change by zhucaiyun 增加四列内容
								{id: 'permitSchoolFilePath', title: '办学许可证', type: 'string', columnClass: 'text-center',resolution: function(value, record, column, grid, dataNo, columnNo) {
									var content = '';
									if (value != '' && value != null) {
									content += "<a href='${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/downloadContractPDF.do?flag=permitschool.pdf&fileRealName="+value+"&fileName="+record.permitSchoolFileName+"' style='color:#0099FF'>下载</a>";
									}
									return content;
									}
								},
								{id: 'permitSchoolValidDate', title: '办学许可证有效期至', type: 'string', columnClass: 'text-center'},
								{id: 'nonEnterpriseFilePath', title: '民非企业登记证', type: 'string', columnClass: 'text-center',resolution: function(value, record, column, grid, dataNo, columnNo) {
									var content = '';
									if (value != '' && value != null) {
									content += "<a href='${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/downloadContractPDF.do?flag=nonenterprise.pdf&fileRealName="+value+"&fileName="+record.nonEnterpriseFileName+"' style='color:#0099FF'>下载</a>";
									}
									return content;
									}
								},
								{id: 'validDate', title: '教学点备案有效期', type: 'string', columnClass: 'text-center'},
								{id: 'areaRecordPath', title: '教学点备案附件', type: 'string', columnClass: 'text-center', resolution: function(value, record, column, grid, dataNo, columnNo) {
								var content = '';
								if (record.areaRecordPath != '' && record.areaRecordPath != null) {
								content += "<a href='${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/downloadContractPDF.do?flag=areabak.pdf&fileRealName="+ record.areaRecordPath+"&fileName="+record.areaRecordName+"' style='color:#0099FF'>下载</a>";
								}
								return content;
								}
								},
								{id: 'areaRecordStatusName', title: '教学区注册及备案情况', type: 'string', columnClass: 'text-center'},
								{id: 'fireControlRecordStatusName', title: '消防备案', type: 'string', columnClass: 'text-center'},
								{id: 'fireControlRecordPath', title: '消防备案附件', type: 'string', columnClass: 'text-center', resolution: function(value, record, column, grid, dataNo, columnNo) {
								var content = '';
								if (record.fireControlRecordPath != '' && record.fireControlRecordPath != null) {
								content += "<a href='${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/downloadContractPDF.do?flag=firerecord.pdf&fileRealName="+ record.fireControlRecordPath+"&fileName="+record.fireControlRecordName+"'  style='color:#0099FF'>下载</a>";
								}
								return content;
								}
								},
								{id: 'contractNum', title: '有效合同', type: 'string', columnClass: 'text-center'},
								{id: 'areaStatusName', title: '教学区状态', type: 'string', columnClass: 'text-center'},
								{id: 'lastMonthFC', title: '上月结转金额',  type: 'string', columnClass: 'text-center'},
								{id: 'master', title: '负责人',  type: 'string', columnClass: 'text-center',hide: true},
								{id: 'phone', title: '联系电话', type: 'string', columnClass: 'text-center',hide: true},
								{id: 'postCode', title: '邮编', type: 'string', columnClass: 'text-center',hide: true},
								{id: 'address', title: '通讯地址', type: 'string', columnClass: 'text-center',hide: true},
								{id: 'busRoutes', title: '乘车路线', type: 'string', columnClass: 'text-center',hide: true}
							];
							//定义表格
								tables.dtGridOption = {
									lang: 'zh-cn',
									ajaxLoad: true,
									check: true,
									loadURL: '${ctx}/backoffice/baseInfo/BaseInfoManageCtrl/queryByPageForArea',
									exportFileName: '教学区管理',
									columns: tables.dtGridColumns,
									gridContainer: 'tb_main_body',
									toolbarContainer: 'tb_main_tool',
									tools: 'refresh|faseQuery|export[excel,pdf,]|print',
									pageSize: 10,
									pageSizeLimit: [10, 50, 100, 500]
								};
								grid = $.fn.DtGrid.init(tables.dtGridOption);
								// 全部导出的一个标志
								grid.diyparameters = {
									"exportOfQueryFlag": "areaListExport",
									"isValid": $("#teachStatus").val()
								};
								grid.load();
								$(function() {
									$("#search").click(that.search);
								});
							},

							search: function() {
								var getUnNormal;
								var getTypeCodeArr = [];
								if($('#unNormal').prop("checked")) {
									getUnNormal = "1";
								}else {
									getUnNormal = "0";
								}
								grid.diyparameters = new Object();
								grid.diyparameters.code = $('#searchData').val();
								grid.diyparameters.name = $('#searchData').val();
								grid.diyparameters.firstRentDate = $('#rentDate').val().replace(/-/g,"");
								// grid.diyparameters.areaRecordStatus = $('#teachPointRecord').val();
								grid.diyparameters.fireControlRecordStatus = $('#fireFiling').val();
								grid.diyparameters.unNormal  = getUnNormal;
								// 处理业务类型的数据
								if($('.selectpicker').selectpicker('val')) {
									var getTypeCodes;
									getTypeCodes= $('.selectpicker').selectpicker('val');
									grid.diyparameters.typeCode = String(getTypeCodes);
								}
								grid.diyparameters.isValid = $("#teachStatus").val();
								grid.diyparameters.exportOfQueryFlag = "areaListExport";
								grid.refresh(true);
							}
						};
        </script>
  </body>
</html>