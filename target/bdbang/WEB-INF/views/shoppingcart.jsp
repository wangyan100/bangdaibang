<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh">
    <head>
        <title>ShoppingCart</title>
    </head>
    <body>
        <div class="container">



            <c:if test="${not empty sessionScope.shoppingCart.orders}">
                <div class="form-group">
                    <form accept-charset="UTF-8"  method = "POST" action = "${contextPath}/shoppingcart" id="shoppingcartform">
                        <div class="col-12 col-sm-12 col-lg-12">
                            <!--div class="table-responsive"-->
                            <div style="overflow-x:auto;">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Apotheken Bestellung</th>
                                            <th>D&C Health Management</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th>
                                                Abholung Datum: <input type="text" name="pickupDate" id="pickupDate" value="${pickupDate}"></input>
                                            </th>
                                            <td>
                                                Abholung Time: <input type="text" name="pickupTime" id="pickupTime"  value="${pickupTime}"/>
                                            </td>
                                            <td>Apotheke:
                                                <select name="shopName" id="shopName"  value="${shopName}" class="custom-select">
                                                    <option value="" ${shopName==''?'selected':''}>Select One...</option>
                                                    <option  value="Muenchen Dr. Beckers Central Apotheke" ${shopName=='Muenchen Dr. Beckers Central Apotheke'?'selected':''} >Muenchen - Dr. Beckers Central Apotheke</option>
                                                    <option value="Frankfurt Prinzen Apotheke"  ${shopName=='Frankfurt Prinzen Apotheke'?'selected':''} >Frankfurt - Prinzen Apotheke</option>
                                                    <option value="Frankfurt Struwwelpeter Apotheke" ${shopName=='Frankfurt Struwwelpeter Apotheke'?'selected':''} >Frankfurt - Struwwelpeter Apotheke</option>
                                                    <option value="Fuessen - Stadtapotheke" ${shopName=='Fuessen - Stadtapotheke'?'selected':''} >Fuessen - Stadtapotheke</option>
                                                    <option value="Hamburg - Apotheke am Hauptbahnhof" ${shopName=='Hamburg - Apotheke am Hauptbahnhof'?'selected':''} >Hamburg - Apotheke am Hauptbahnhof</option>
                                                </select>
                                            </td>
                                        <tr>
                                        <tr>
                                            <th>    
                                                ReiseleiterName: <input type="text" name="tourGuideName" value="${tourGuideName}" id="tourGuideName"/>
                                            </th>
                                            <td> 

                                                Reiseleiter ID : <input type="text" name="tourGuideID" value="${tourGuideID}" id="tourGuideID"  />
                                            </td>
                                            <td> 
                                                GastName : <input type="text" name="touristName" value="${touristName}" id="touristName"/>
                                            </td>
                                        <tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>

                        <div class="col-12 col-sm-12 col-lg-12">
                            <!--div class="table-responsive"-->
                            <div style="overflow-x:auto;">
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
                                        <c:forEach var="order" items="${sessionScope.shoppingCart.orders}"  varStatus="productIndex">
                                            <tr>
                                                <th>${productIndex.index +1}</th>
                                                <td>${order.key.pzn}</td>
                                                <td>${order.key.germanName}</td>
                                                <td>
                                                    <a onclick="javascript:addURL(this);" href="${contextPath}/shoppingcart?action=plus&pzn=${order.key.pzn}">
                                                        <span style="font-size:150%;" class="glyphicon glyphicon-plus"></span>
                                                    </a>

                                                    ${order.value}

                                                    <a onclick="javascript:addURL(this);" href="${contextPath}/shoppingcart?action=minus&pzn=${order.key.pzn}">
                                                        <span style="font-size:150%;" class="glyphicon glyphicon-minus"></span>
                                                    </a>
                                                </td>
                                                <td>${order.key.chineseName}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>                 
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <input type="submit" id="submit" name="submit" value="submitorder" />
                    </form>
                </div>
            </div>
        </c:if>
    </div>

<content tag="local_script">
    <script type="text/javascript">




        function addURL(element)
        {
            $(element).attr('href', function () {
                return this.href
                        + '&shopName=' + $('#shopName').val()
                        + '&tourGuideName=' + $('#tourGuideName').val()
                        + '&tourGuideID=' + $('#tourGuideID').val()
                        + '&touristName=' + $('#touristName').val()
                        + '&pickupDate=' + $('#pickupDate').val()
                        + '&pickupTime=' + $('#pickupTime').val();

                ;
            });
        }

        $(function () {
            $("#pickupDate").datepicker({dateFormat: 'yy-mm-dd'});
        });


        $("#submit").click(function (event) {
            if (!confirm("confirm  order"))
                event.preventDefault();
        });

        $(document).ready(function () {


            $(document).keyup(function (e) {
                console.log("key up ##############")
                if ($("#tourGuideID:focus") && (e.keyCode === 13)) {

                    e.stopPropagation()
                    e.preventDefault();

                    // var pathname = window.location.pathname; // Returns path only
                    var url = window.location.href;     // Returns full URL
                    //var context = url.replace(pathname, '');
                    var lastIndex = url.lastIndexOf("/");
                    url = url.substr(0, lastIndex);
                    url = url + '/querytourguide' + '?tourguideid=' + $('#tourGuideID').val();
                    console.log(url);
                    //context = localhost:8080/


                    $.ajax({
                        url: url,
                        timeout: 100000,
                        success: function (data) {
                            console.log("SUCCESS: ", data);
                            $('#tourGuideName').val(data.name + data.chineseName);
                            $('#tourGuideID').val(data.tourguideid);
                        },
                        error: function (e) {
                            console.log("ERROR: ", e);
                        },
                        done: function (e) {
                            console.log("DONE");
                        }
                    });
                }
            });


            /*
             $.validator.addMethod("valueNotEquals", function (value, element, arg) {
             return arg !== value;
             }, "Choose Apotheke");
             */
            $('#shoppingcartform').validate({// initialize the plugin

                submitHandler: function (form) {
                    if (confirm("Click Ok to Submit")) {
                        form.submit();
                    }
                },
                rules: {
                    shopName: {
                        required: true
                    },

                    pickupDate: {
                        required: true
                    },
                    pickupTime: {
                        required: true
                    },
                    tourGuideName: {
                        required: true
                    },
                    tourGuideID: {
                        required: true
                    },
                    touristName: {
                        required: true
                    }
                },

                messages: {
                    shopName: {
                        required: 'Please select the Apotheke'
                    }
                }
            });
        });
    </script>
</content>



</body>
</html>
