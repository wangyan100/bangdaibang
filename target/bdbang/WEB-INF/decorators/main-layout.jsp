<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8">
        <title>帮带帮</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <link href="<c:url value="/resources/css/jquery-ui.css" />"
              rel="stylesheet"  type="text/css" />
        <link href="<c:url value="/resources/css/bootstrap.min.css" />"
              rel="stylesheet"  type="text/css" />
        <link href="<c:url value="/resources/css/common.css" />"
              rel="stylesheet"  type="text/css" />
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    <body>
        <div id="wrap">
            <c:import url="/WEB-INF/views/navbar.jsp"/>

            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12">

                                <hr class="soften">

                                <c:out value="${contextPath}"/>
                                <decorator:body />

                            </div>
                        </div><!--/col-->
                    </div><!--/row-->
                </div><!--/col-->
            </div><!--/row-->
            <hr class="soften">
        </div>
        <c:import url="/WEB-INF/views/footer.jsp"/>
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-1.12.4.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-ui.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
        <decorator:getProperty property="page.local_script"></decorator:getProperty>
    </body>
</html>
