<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">                                   
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">帮带帮</a>
        </div>
        <div class="navbar-collapse collapse">  
            <ul class="nav navbar-nav">
                <li class="active"><a href="<c:url value="/" />">浏览</a></li>
                <li><a href="${contextPath}/upload">发布</a> </li>
                <li><a href="${contextPath}/shoppingcart">打分</a></li>
                <li> <a href="${contextPath}/orders">管理员</a></li>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <li><a onclick="document.forms['logoutForm'].submit()">登出</a> </li>
                    <form accept-charset=utf-8 id="logoutForm" method="POST" action="${contextPath}/logout">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </c:if>
            </ul>
        </div>   			      		 
    </div>
</div>