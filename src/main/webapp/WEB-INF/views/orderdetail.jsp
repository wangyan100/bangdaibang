<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh">
    <head>
        <title>OrderDetail</title>
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

            <div name="orderdetail" id="orderdetail">

                <c:if test="${not empty order}">
                    <table class="table table-striped">
                        <thead>
                            <tr>
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
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
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

                            </tr>
                        </tbody>
                    </table>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>PZN</th>
                                <th>German</th>
                                <th>Amount</th>
                                <th>Chinese</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="orderdetail" items="${order.orderdetails}"  varStatus="orderdetailIndex">
                                <tr>
                                    <td>${orderdetailIndex.index +1}</td>
                                    <td>${orderdetail.pzn}</td>
                                    <td>${orderdetail.germanName}</td>
                                    <td>${orderdetail.amount}</td>
                                    <td>${orderdetail.chineseName}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>            
                </c:if>
            </div>

            <div>
                <span>
                    <a id="sendmail-button">
                        <button type="button" class="btn btn-primary">Send Email  </button>
                    </a>
                    <a href="${contextPath}/orderdetaildownload?id=${order.id}&ordernumber=${order.orderNumber}">
                        <button type="button" class="btn btn-primary">Download Order  </button>
                    </a>

                    <!-- return result of confirmDelete will decide if herf will be called or not-->    
                    <a onclick="return confirmDelete(this);" href="${contextPath}/orderdetail?action=delete&id=${order.id}">
                        <button type="button" class="btn btn-primary">Delete Order</button>
                    </a>


                    <td>    
                        PZN: <input type="text" name="pzn" id="pzn"/>
                    </td>
                    <td> 
                        Menge: <input type="text" name="amount" id="amount" />
                    </td>

                    <a onclick="return confirmAdd(this);" href="${contextPath}/orderdetail?action=addproduct&id=${order.id}">
                        <button type="button" class="btn btn-primary">Add Product</button>
                    </a>

                    <a onclick="return confirmRemove(this);" href="${contextPath}/orderdetail?action=removeproduct&id=${order.id}">
                        <button type="button" class="btn btn-primary">Remove Product</button>
                    </a>
                </span>
            </div>

        </div>

        <script type="text/javascript">
            function confirmDelete(element) {

                $(element).attr('href', function () {
                    this.href = this.href
                            + '&pzn=' + $('#pzn').val()
                            + '&amount=' + $('#amount').val();
                    ;
                });

                return confirm("Are you sure to delete this order?");

            }

            function confirmAdd(element) {

                $(element).attr('href', function () {
                    this.href = this.href
                            + '&pzn=' + $('#pzn').val()
                            + '&amount=' + $('#amount').val();
                    ;
                });

                return confirm("Are you sure to add product for this order?");

            }

            function confirmRemove(element) {
                $(element).attr('href', function () {
                    this.href = this.href
                            + '&pzn=' + $('#pzn').val()
                            + '&amount=' + $('#amount').val();
                    ;
                });

                return confirm("Are you sure to remove product for this order?");

            }

            $(function () {
                var doc = new jsPDF();
                var specialElementHandlers = {
                    '#editor': function (element, renderer) {
                        return true;
                    }
                };

                $('#cmd').click(function () {
                    console.log('it is called on click');
                    doc.fromHTML($('#orderdetail').html(), 15, 15, {
                        'width': 170,
                        'elementHandlers': specialElementHandlers
                    });
                    doc.save('orderdetail.pdf');
                });
            });

            $(document).ready(function (event) {
                $.ajaxPrefilter(function (options, originalOptions, jqXHR) {
                                    jqXHR.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                });

                $('#sendmail-button').click(function () {
                    $.ajax({
                        type: 'post',
                        url: "${contextPath}/orderdetailsendmail",
                        dataType: 'json',
                        data: {
                            id: "${order.id}",
                            ordernumber: "${order.orderNumber}"
                        }
                    }).done(function (response) {
                        console.log(response);
                        alert("Email sent successfully!");
                    }).fail(function (response) {
                        console.log(response);
                        alert("Failed to send email!");
                    });
                });
            });

        </script>
    </body>
</html>
