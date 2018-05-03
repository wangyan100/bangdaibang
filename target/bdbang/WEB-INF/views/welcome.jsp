<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh">
    <head>
        <title>Welcome</title>
    </head>
    <body>
        <div class="container">
            <c:if test="${not empty products}">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>PZN</th>
                            <th>German</th>
                            <th>Chinese</th>
                            <th>Unit</th>
                            <th>Price</th>
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${products}"  varStatus="productIndex">
                            <tr>
                                <td>${productIndex.index +1 }</td>
                                <td>${product.pzn}</td>
                                <td>${product.germanName}</td>
                                <td>${product.chineseName}</td>
                                <td>${product.unit}</td>
                                <td>${product.price}</td>
                                <td>
                                    <input name="amount" type="number" value=1  min="1" max="999"/>
                                </td>
                                <td>
                                    <a onclick="confirmSubmit(this)" href="${contextPath}/welcome?action=addShoppingCart&pzn=${product.pzn}">
                                        <button type="button" class="btn btn-primary">Add to ShoppingCart</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>

        <script type="text/javascript">
            function confirmSubmit(element) {
                var amount;
                $(element).attr('href', function () {
                    amount = $(element).parent().prev().find('input').val();
                    this.href = this.href + '&amount=' + amount;
                });

                return !isNaN(amount)
                //return confirm("add Prouction Amount "+amount);
            }

        </script>
    </body>
</html>
