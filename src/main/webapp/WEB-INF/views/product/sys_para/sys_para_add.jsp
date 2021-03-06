<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>新增系统参数模块</title>
<%@include file="../../included/includedStyle.jsp" %>
</head>

<body class="body-bg">
    <div class="wrapper-box">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-body">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class="icon-layers font-green"></i> <span class="caption-subject bold uppercase"> 新增系统参数表 </span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form action="#" class="form-horizontal" id="form-add">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                      安装点                     <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                           <!--  <input type="text" class="form-control" placeholder="" name="baseId" id="baseId"> -->
                                           
                                           <select name="baseId" class="selectpicker form-control" id="baseId">
                                                <c:forEach items="${baseIdEnums}" var="baseIdEnum">
                                                    <option value="${baseIdEnum.key}">${baseIdEnum.value}</option>
                                                </c:forEach>
                                            </select>
                                           
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入安装点数字代码</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            地区代码 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="regionCode" id="regionCode">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入地区代码，系统中对应的地区代码表内容，如果是0表示对所有的地区有效</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            县区代码 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="countyCode" id="countyCode">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入县区代码，系统中对应的县区代码表内容，如果是0表示对所有的县区有效</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数代码 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="paramCode" id="paramCode">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入参数代码</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数名称 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="paramName" id="paramName">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入参数名称</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            所属系统
                        <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="paramClass" class="selectpicker form-control" id="paramClass">
                                                <c:forEach items="${paramSystemEnums}" var="paramSystemEnums">
                                                    <option value="${paramSystemEnums.key}">${paramSystemEnums.value}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入所属系统
                    系统基础参数所属的子系统：
                    1 －－ 系统管理
                    2 －－ 业务管理
                    3 －－ 综合客服
                    4 －－ 帐务管理
                    5 －－ 帐务处理
                    6 －－ 接口管理</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数类型  <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                             <select name="paramDataType" class="selectpicker form-control" id="paramDataType">
                                                <c:forEach items="${paramTypeEnums}" var="paramTypeEnums">
                                                    <option value="${paramTypeEnums.key}">${paramTypeEnums.value}</option>
                                                </c:forEach>
                                            </select>
                                             <div class="form-control-focus"></div>
                                            <span class="help-block">请输入参数类型 参数的数据类别：(1--Char  2--Number  3--Boolean  4？Date 5－Long 6-String 7-Double)SYS_BASE_TYPE.code_type=1</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数取值 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="paramValue" id="paramValue">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入参数取值</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            参数说明 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="" name="paramDesc" id="paramDesc">
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入参数说明</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            所属产品 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <select name="prodId" class="selectpicker form-control" id="prodId">
                                                <c:forEach items="${prodEnums}" var="prodEnum">
                                                    <option value="${prodEnum.key}">${prodEnum.value}</option>
                                                </c:forEach>
                                            </select>
                                          
                                          
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入所属产品</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            产品版本 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                          <select name="verCode" class="selectpicker form-control" id="verCode">
                                                <c:forEach items="${verEnums}" var="verEnum">
                                                    <option value="${verEnum.key}">${verEnum.value}</option>
                                                </c:forEach>
                                            </select>
                                             
                                          
                                             <div class="form-control-focus"></div>
                                            <span class="help-block">请输入产品版本</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-md-line-input">
                                        <label class="col-md-4 control-label" for="form_control_1">
                                            发布版本 <span class="required">*</span>
                                        </label>
                                        <div class="col-md-8">
                                            <!-- <input type="text" class="form-control" placeholder="" name="relCode" id="relCode"> -->
                                            <select name="relCode" class="selectpicker form-control" data-live-search="true" id="relCode">
                                            </select>
                                            <div class="form-control-focus"></div>
                                            <span class="help-block">请输入发布版本</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-9">
                                        <button type="submit" class="btn green">提交</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file="../../included/includedJs.jsp" %>

<script type="text/javascript">

jQuery(document).ready(function() {
    
	loadVerCodeSelect();
    loadParentModuleSelect();
    loadRelSelect();
    $('#prodId').change(function(){
        loadVerCodeSelect();
        loadParentModuleSelect();
        loadRelSelect();
    });
    
    $('#verCode').change(function(){
        loadParentModuleSelect();
        loadRelSelect();
    });
    
    //表单校验提交
    //[1]自定义校验规则
    var rules = {
            paraId:"required",
            regionCode:"required",
            countyCode:"required",
            paramCode:"required",
            paramName:"required",
            paramClass:"required",
            paramDataType:"required",
            paramValue:"required",
            paramDesc:"required",
           /*  prodId:"required",
            verCode:"required",
            relCode:"required" */
    };
    //[2]表单校验初始化
    initFormValidate('form-add', rules, 'prod/sys_para/add', 'add');
    
});

</script>
</body>
</html>