package team.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team.entity.Brand;
import team.entity.Category;
import team.entity.Color;
import team.entity.Gender;
import team.entity.Product;
import team.entity.Sizes;

@Service
@Transactional
public class CollectionServiceImpl implements CollectionService {

    @Autowired
    ProductService productService;

    @Override
    public List<Product> showProducts() {
        List<Product> products = productService.findAll();
        List<Product> productsInStock = new ArrayList();
        List<Product> activeProducts = new ArrayList();

        for (Product p : products) {
            if (p.getStock() != 0) {
                productsInStock.add(p);
            }
        }
        for (Product p : productsInStock) {
            if (p.getStatus() != 0) {
                activeProducts.add(p);
            }
        }
        return activeProducts;
    }

    @Override
    public List<Product> getFilters(
            List<Brand> brands,
            List<Category> categories,
            List<Gender> genders,
            List<Sizes> sizes,
            List<Color> colors) {

        String query = "SELECT p FROM Product p WHERE ";

        try {
            String brandQuery = "brandid IN (";
            for (int i = 0; i <= brands.size() - 1; i++) {
                brandQuery = brandQuery.concat("'" + brands.get(i).getBrandid() + "'");
                if (i == brands.size() - 1) {
                    brandQuery = brandQuery.concat(") AND ");
                } else {
                    brandQuery = brandQuery.concat(" , ");
                }
            }
            query = query + brandQuery;
        } catch (NullPointerException e) {
        }
        try {
            String categoryQuery = "categoryid IN (";
            for (int i = 0; i <= categories.size() - 1; i++) {
                categoryQuery = categoryQuery.concat("'" + categories.get(i).getCategoryid() + "'");
                if (i == categories.size() - 1) {
                    categoryQuery = categoryQuery.concat(") AND ");
                } else {
                    categoryQuery = categoryQuery.concat(" , ");
                }
            }
            query = query + categoryQuery;
        } catch (NullPointerException e) {
        }
        try {
            String genderQuery = "genderid IN (";
            for (int i = 0; i <= genders.size() - 1; i++) {
                genderQuery = genderQuery.concat("'" + genders.get(i).getGenderid() + "'");
                if (i == genders.size() - 1) {
                    genderQuery = genderQuery.concat(") AND ");
                } else {
                    genderQuery = genderQuery.concat(" , ");
                }
            }
            query = query + genderQuery;
        } catch (NullPointerException e) {
        }
        try {
            String sizesQuery = "sizeid IN (";
            for (int i = 0; i <= sizes.size() - 1; i++) {
                sizesQuery = sizesQuery.concat("'" + sizes.get(i).getSizesid() + "'");
                if (i == sizes.size() - 1) {
                    sizesQuery = sizesQuery.concat(") AND ");
                } else {
                    sizesQuery = sizesQuery.concat(" , ");
                }
            }
            query = query + sizesQuery;
        } catch (NullPointerException e) {
        }
        try {
            String colorQuery = "colorid IN (";
            for (int i = 0; i <= colors.size() - 1; i++) {
                colorQuery = colorQuery.concat("'" + colors.get(i).getColorid() + "'");
                if (i == colors.size() - 1) {
                    colorQuery = colorQuery.concat(") AND ");
                } else {
                    colorQuery = colorQuery.concat(" , ");
                }
            }
            query = query + colorQuery;
        } catch (NullPointerException e) {
        }
        //remove last "AND " and triming the last space
        query = query.substring(0, query.lastIndexOf("AND ")).trim();

        List<Product> products = productService.findByFilters(query);

        products = removeZeroStockAndInactive(products);

        return products;
    }

    //======================================SHOW SINGLE PRODUCT INFO========================================== 
    @Override
    public Product showProduct(int productid) {

        return productService.findById(productid);
    }

    @Override
    public List<Product> findFourRelatedProducts(int productid) {

        List<Product> relatedProducts = new ArrayList();
        List<Integer> listOfIds = new ArrayList();
        List<Product> allProducts = productService.findAll();
        List<Product> activeProducts = removeZeroStockAndInactive(allProducts);

        for (Product x : activeProducts) {
            listOfIds.add(x.getProductid());
        }
        listOfIds.remove(Integer.valueOf(productid)); //remove the product that shows as main in sigle product info page
        Collections.shuffle(listOfIds);
        for (int i = 1; i <= 4; i++) {
            relatedProducts.add(productService.findById(listOfIds.get(i)));
        }
        return relatedProducts;

    }

    //=======================================SUPPORT METHODS===============================================
    private List<Product> removeZeroStockAndInactive(List<Product> products) {
        List<Product> productsInStock = new ArrayList();
        List<Product> activeProducts = new ArrayList();
        for (Product p : products) {
            if (p.getStock() != 0) {
                productsInStock.add(p);
            }
        }
        for (Product p : productsInStock) {
            if (p.getStatus() != 0) {
                activeProducts.add(p);
            }
        }
        return activeProducts;
    }

}
