/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.File;
import dal.BrandDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.List;
import model.Brand;
import model.Category;
import model.Product;

@MultipartConfig
public class ProductManager extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cdao = new CategoryDAO();
        BrandDAO bdao = new BrandDAO();
        ProductDAO pdao = new ProductDAO();
        List<Category> categoryList = cdao.getAllCategories();
        List<Brand> brandList = bdao.getAllBrands();
        String brandSelect = request.getParameter("brandSelect");
        String categorySelect = request.getParameter("categorySelect");
        String pageParam = request.getParameter("page");
        String priceRange = request.getParameter("priceRange");
        try {
            int page = (pageParam == null) ? 1 : Integer.parseInt(pageParam);
            int brandId = (brandSelect == null) ? 0 : Integer.parseInt(brandSelect);
            int categoryId = (categorySelect == null) ? 0 : Integer.parseInt(categorySelect);
            int recordsPerPage = 6;
            int offset = (page - 1) * recordsPerPage;
            int totalRecords = pdao.countTotalRecords(brandId, categoryId, priceRange, null);
            int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
            List<Product> productList = pdao.getProducts(brandId, categoryId, offset, recordsPerPage, priceRange, null, null);
            request.setAttribute("productList", productList);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentBrand", brandId);
            request.setAttribute("currentCategory", categoryId);
            request.setAttribute("currentPriceRange", priceRange);
        } catch (NumberFormatException ex) {
            request.setAttribute("error", "Error: 'Invalid filter parameters'");
        }
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("brandList", brandList);
        request.setAttribute("pageName", "product-manager");
        request.getRequestDispatcher("./admin/productManager.jsp").forward(request, response);
    }

    private String getAndSaveImg(Part filePart) throws IOException {
        String relativePath = "resources/images/";
        String uploadPath = getServletContext().getRealPath("");
        String projectRoot = uploadPath.replace("build" + File.separator + "web", "");
        String fileSavePath = projectRoot + "web" + File.separator + relativePath;
        File uploadDir = new File(fileSavePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        String fileName = filePart.getSubmittedFileName();
        String filePath = fileSavePath + File.separator + fileName;
        filePart.write(filePath);
        return relativePath + fileName;
    }

    private boolean deleteFile(String relativeFilePath) {
        try {
            String uploadPath = getServletContext().getRealPath("");
            String projectRoot = uploadPath.replace("build" + File.separator + "web", "");
            String absoluteFilePath = projectRoot + "web" + File.separator + relativeFilePath.replace("/", File.separator);
            File file = new File(absoluteFilePath);
            return file.exists() && file.delete();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String add = request.getParameter("add");
        ProductDAO pdao = new ProductDAO();
        String delete = request.getParameter("delete");
        String updateOther = request.getParameter("updateOther");

        if (add != null && add.equals("addOther")) {
            try {
                String productName = request.getParameter("otherName");
                if (productName == null || productName.trim().isEmpty()) {
                    request.setAttribute("error", "Error: 'Product name is required'");
                    doGet(request, response);
                    return;
                }

                String categoryParam = request.getParameter("otherCategory");
                if (categoryParam == null || categoryParam.trim().isEmpty()) {
                    request.setAttribute("error", "Error: 'Category must be selected'");
                    doGet(request, response);
                    return;
                }
                int categoryId;
                try {
                    categoryId = Integer.parseInt(categoryParam);
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Error: 'Invalid category'");
                    doGet(request, response);
                    return;
                }

                String brandParam = request.getParameter("otherBrand");
                if (brandParam == null || brandParam.trim().isEmpty()) {
                    request.setAttribute("error", "Error: 'Brand must be selected'");
                    doGet(request, response);
                    return;
                }
                int brandId;
                try {
                    brandId = Integer.parseInt(brandParam);
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Error: 'Invalid brand'");
                    doGet(request, response);
                    return;
                }

                String priceParam = request.getParameter("otherPrice");
                if (priceParam == null || priceParam.trim().isEmpty()) {
                    request.setAttribute("error", "Error: 'Price is required'");
                    doGet(request, response);
                    return;
                }
                int price;
                try {
                    price = Integer.parseInt(priceParam);
                    if (price <= 0) {
                        request.setAttribute("error", "Error: 'Price must be positive'");
                        doGet(request, response);
                        return;
                    }
                    if (price > Integer.MAX_VALUE / 2) { 
                        request.setAttribute("error", "Error: 'Price exceeds limit'");
                        doGet(request, response);
                        return;
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Error: 'Price must be numeric'");
                    doGet(request, response);
                    return;
                }

                String generalInfo = request.getParameter("otherDescription");
                if (generalInfo == null || generalInfo.trim().isEmpty()) {
                    request.setAttribute("error", "Error: 'Description is required'");
                    doGet(request, response);
                    return;
                }

                String warrantyInfo = request.getParameter("otherWarranty");
                if (warrantyInfo == null || warrantyInfo.trim().isEmpty()) {
                    request.setAttribute("error", "Error: 'Warranty info is required'");
                    doGet(request, response);
                    return;
                }

                String stockParam = request.getParameter("otherStock");
                if (stockParam == null || stockParam.trim().isEmpty()) {
                    request.setAttribute("error", "Error: 'Stock is required'");
                    doGet(request, response);
                    return;
                }
                int stockUnits;
                try {
                    stockUnits = Integer.parseInt(stockParam);
                    if (stockUnits < 0) {
                        request.setAttribute("error", "Error: 'Stock must be non-negative'");
                        doGet(request, response);
                        return;
                    }
                    if (stockUnits > Integer.MAX_VALUE / 2) { 
                        request.setAttribute("error", "Error: 'Stock exceeds limit'");
                        doGet(request, response);
                        return;
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Error: 'Stock must be numeric'");
                    doGet(request, response);
                    return;
                }

                Part filePart = request.getPart("otherImage");
                if (filePart == null || filePart.getSize() == 0) {
                    request.setAttribute("error", "Error: 'Image is required'");
                    doGet(request, response);
                    return;
                }
                String fileName = filePart.getSubmittedFileName();
                if (!fileName.endsWith(".jpg") && !fileName.endsWith(".png") && !fileName.endsWith(".jpeg")) {
                    request.setAttribute("error", "Error: 'Invalid image format'");
                    doGet(request, response);
                    return;
                }
                
                if (filePart.getSize() > 10 * 1024 * 1024) {
                    request.setAttribute("error", "Error: 'Image size exceeds limit'");
                    doGet(request, response);
                    return;
                }
                String image = getAndSaveImg(filePart);

               
                pdao.addProduct(productName, brandId, categoryId, price, generalInfo, warrantyInfo, stockUnits, image);
                response.sendRedirect("product-manager?categorySelect=" + categoryId);
            } catch (IOException e) {
                request.setAttribute("error", "Error: 'Error uploading image'");
                doGet(request, response);
            }
        }

        if (delete != null) {
            try {
                int deleteId = Integer.parseInt(delete);
                String imgPath = pdao.getProductsById(deleteId).get(0).getImage();
                deleteFile(imgPath);
                pdao.deleteProduct(deleteId);
            } catch (Exception e) {
                request.setAttribute("error", "Error: 'Error deleting product'");
            }
            doGet(request, response);
        }

        if (updateOther != null) {
            try {
                int id = Integer.parseInt(updateOther);
                String productName = request.getParameter("newName");
                if (productName == null || productName.trim().isEmpty()) {
                    request.setAttribute("error", "Error: 'Product name is required'");
                    doGet(request, response);
                    return;
                }

                String priceParam = request.getParameter("newPrice");
                int price = Integer.parseInt(priceParam);
                if (price <= 0) {
                    request.setAttribute("error", "Error: 'Price must be positive'");
                    doGet(request, response);
                    return;
                }

                int brandId = Integer.parseInt(request.getParameter("newBrand"));
                int categoryId = Integer.parseInt(request.getParameter("newCategory"));

                String generalInfo = request.getParameter("newInfo");
                if (generalInfo == null || generalInfo.trim().isEmpty()) {
                    request.setAttribute("error", "Error: 'Description is required'");
                    doGet(request, response);
                    return;
                }

                String warrantyInfo = request.getParameter("newWarranty");
                if (warrantyInfo == null || warrantyInfo.trim().isEmpty()) {
                    request.setAttribute("error", "Error: 'Warranty info is required'");
                    doGet(request, response);
                    return;
                }

                int stockUnits = Integer.parseInt(request.getParameter("newStockUnits"));
                if (stockUnits < 0) {
                    request.setAttribute("error", "Error: 'Stock must be non-negative'");
                    doGet(request, response);
                    return;
                }

                Part imagePart = request.getPart("newImg");
                String image = null;
                if (imagePart != null && imagePart.getSize() > 0) {
                    String fileName = imagePart.getSubmittedFileName();
                    if (!fileName.endsWith(".jpg") && !fileName.endsWith(".png") && !fileName.endsWith(".jpeg")) {
                        request.setAttribute("error", "Error: 'Invalid image format'");
                        doGet(request, response);
                        return;
                    }
                    image = getAndSaveImg(imagePart);
                    String oldImgPath = pdao.getProductsById(id).get(0).getImage();
                    deleteFile(oldImgPath);
                }

                pdao.updateOther(id, productName, brandId, categoryId, price, generalInfo, warrantyInfo, stockUnits, image);
                response.sendRedirect("product-manager?categorySelect=" + categoryId);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Error: 'Price and stock must be numeric'");
                doGet(request, response);
            } catch (IOException e) {
                request.setAttribute("error", "Error: 'Error updating image'");
                doGet(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Manages product CRUD operations";
    }
}
