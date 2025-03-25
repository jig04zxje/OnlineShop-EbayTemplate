/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import com.sun.jdi.connect.spi.Connection;
import context.DBContext;
import java.io.IOException;
import java.util.List;
import model.Product;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author JIGGER
 */
public class ProductDAOIT {
    
    public ProductDAOIT() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }


    /**
     * Test of addProduct method, of class ProductDAO.
     */
    @Test
    public void testAddProductTC1() {
        System.out.println("addProduct");
        String productName = "Acer5";
        int brandId = 23;
        int categoryId = 19;
        int price = 100000;
        String generalInfo = "Best laptop gaming 2021";
        String warrantyInfo = "12";
        int stockUnits = 10;
        String image = "default.img";
        ProductDAO instance = new ProductDAO();
        boolean expResult = true;
        boolean result = instance.addProduct(productName, brandId, categoryId, price, generalInfo, warrantyInfo, stockUnits, image);
        assertEquals(expResult, result);
    }
    
        @Test
    public void testAddProductTC2() {
        System.out.println("addProduct");
        String productName = "Acer5";
        int brandId = -1;
        int categoryId = 19;
        int price = 100000;
        String generalInfo = "Best laptop gaming 2021";
        String warrantyInfo = "12";
        int stockUnits = 10;
        String image = "default.img";
        ProductDAO instance = new ProductDAO();
        boolean expResult = false;
        boolean result = instance.addProduct(productName, brandId, categoryId, price, generalInfo, warrantyInfo, stockUnits, image);
        assertEquals(expResult, result);
    }
}
