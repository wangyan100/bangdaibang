/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.yanwang.bdbang.repository;

import com.yanwang.bdbang.model.Order;
import com.yanwang.bdbang.model.OrderDetail;
import com.yanwang.bdbang.model.Product;
import com.yanwang.bdbang.model.Tourguide;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author yw
 */
public interface MedShopDao {

    void saveProduct(Product product);

    void updateProduct(Product product);
    
    void saveTourGuide(Tourguide tourguide);
    
    void updateTourGuide(Tourguide tourguide);

    void saveOrder(Order order);
    
    void saveOrderDetail(OrderDetail orderDetail);
    
    void deleteOrderDetail(long orderdetailid);
    
    void updateOrderDetail(OrderDetail orderDetail);

    Product getProductByPZN(String pzn);
    
    Tourguide getTourguideByTourguideid(String tourguideid);

    java.util.List<Product> getAllProducts();

    List<Order> getAllOrders();

    int getTodayOrderNumber();

    Order getOrder(long id);
    

    void updateOrder(Order order);
    
    List queryReport(String hql, Date from, Date to);
}
