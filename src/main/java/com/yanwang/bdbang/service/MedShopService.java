/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.yanwang.bdbang.service;

import com.yanwang.bdbang.model.Order;
import com.yanwang.bdbang.model.Product;
import com.yanwang.bdbang.model.ShoppingCart;
import com.yanwang.bdbang.model.Tourguide;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author yw
 */
public interface MedShopService {
    
    List<Product> getAllProducts();
    
    void addProductToShoppingCart(ShoppingCart shoppingCart,String pzn,int amount);
    
    void changeProductNumberAtShoppingCart(ShoppingCart shoppingCart,String pzn, int i);
    
    void makeOrder(ShoppingCart shoppingCart);
    
    List<Order> getAllOrders();
    
    Order getOrder(long id);
    
    void setOrderInvalid(long id);
    
    void addProductToOrder(long orderid, String pzn, int amount);
    
    void removeProductFromOrder(long orderid,String pzn, int amount);
    
    List queryReport(String sql, Date fromDate , Date toDate);
    
    Tourguide getTourguideByTourguideid(String tourguideid);
    
    
    
}
