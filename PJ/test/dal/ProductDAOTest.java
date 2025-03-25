/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

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
public class ProductDAOTest {

    public ProductDAOTest() {
    }

    public String priceRange = "allRange";

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
     * Test of countTotalRecords method, of class ProductDAO.
     */
    @Test
    public void testCountTotalRecordsTC1() {
        System.out.println("countTotalRecords");
        int brandId = 23;
        int categoryId = 19;
        String searchKey = "acer5";
        ProductDAO instance = new ProductDAO();
        int expResult = 13;
        int result = instance.countTotalRecords(brandId, categoryId, priceRange, searchKey);
        assertEquals(expResult, result);
    }

    /**
     * Test of countTotalRecords method, of class ProductDAO.
     */
    @Test
    public void testCountTotalRecordsTC2() {
        System.out.println("countTotalRecords");
        int brandId = 1;
        int categoryId = 0;
        String searchKey = "";
        ProductDAO instance = new ProductDAO();
        int expResult = 0;
        int result = instance.countTotalRecords(brandId, categoryId, priceRange, searchKey);
        assertEquals(expResult, result);
    }

    /**
     * Test of countTotalRecords method, of class ProductDAO.
     */
    @Test
    public void testCountTotalRecordsTC3() {
        System.out.println("countTotalRecords");
        int expResulT = 0;
        int brandId = 0;
        int categoryId = 1;
        String searchKey = "";
        ProductDAO instance = new ProductDAO();
        int result = instance.countTotalRecords(brandId, categoryId, priceRange, searchKey);
        assertEquals(expResulT, result);
    }

    @Test
    public void testCountTotalRecordsTC4() {
        System.out.println("countTotalRecords");
        int brandId = 1;
        int categoryId = 1;
        String searchKey = "acer5";
        ProductDAO instance = new ProductDAO();
        int expResult = 0;
        int result = instance.countTotalRecords(brandId, categoryId, priceRange, searchKey);
        assertEquals(expResult, result);
    }

}
