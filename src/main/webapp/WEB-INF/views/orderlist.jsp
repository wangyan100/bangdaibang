<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh">
    <head>
        <title>Orders</title>
    </head>
    <body>
        <div class="container">

            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

                <h2>Orders ${pageContext.request.userPrincipal.name} | 
                    <a onclick="document.forms['logoutForm'].submit()">Logout</a> |
                    <a href="${contextPath}/welcome">Home</a> 
                </h2>

            </c:if>

            <c:if test="${not empty orders}">
                <div class="col-12 col-sm-12 col-lg-12">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Bestellungnummer</th>
                                    <th>Bestellungdatum</th>
                                    <th>Reiseleitername</th>
                                    <th>ReiseleiterID</th>
                                    <th>Gastname</th>
                                    <th>Abholungdatum</th>
                                    <th>Abholungtime</th>
                                    <th>Apotheke</th>
                                    <th>Arbeitername</th>
                                    <th>Totalpreis</th>
                                    <th> </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${orders}"  varStatus="orderIndex">
                                    <tr>
                                        <td>${orderIndex.index +1 }</td>
                                        <td>${order.orderNumber}</td>
                                        <td>${order.orderdate}</td>
                                        <td>${order.tourGuideName}</td>
                                        <td>${order.tourGuideID}</td>
                                        <td>${order.touristName}</td>
                                        <td>${order.pickupDate}</td>
                                        <td>${order.pickupTime}</td>
                                        <td>${order.shopname}</td>
                                        <td>${order.creator}</td>
                                        <td>${order.totalPrice}</td>
                                        <td>
                                            <a href="${contextPath}/orderdetail?id=${order.id}">
                                                <button type="button" class="btn btn-primary">Details</button>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:if>

        </div>
    </body>
</html>
