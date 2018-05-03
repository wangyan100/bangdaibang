/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.yanwang.bdbang.util;

import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author yw
 */
public class Util {
    static Properties prop = new Properties();
    static {
        try {
            prop.load(Util.class.getClassLoader().getResourceAsStream("application.properties"));
        } catch (IOException ex) {
            Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static String getAdminName(){
       return prop.getProperty("ADMINUSER");
    }

    public static boolean isInteger(String s) {
        try {
            Integer.parseInt(s);
        } catch (NumberFormatException e) {
            return false;
        } catch (NullPointerException e) {
            return false;
        }
        // only got here if we didn't return false
        return true;
    }

    public static float convertEuroPrice(String price) {
        price = price.trim();
        return Float.parseFloat(price.substring(0, price.indexOf("€")));
    }

}
