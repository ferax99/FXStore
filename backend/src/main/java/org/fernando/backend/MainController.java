package org.fernando.backend;


import org.fernando.backend.model.Category;
import org.fernando.backend.model.Product;
import org.fernando.backend.service.CategoryService;
import org.fernando.backend.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
public class MainController {
    private ProductService productService;
    private CategoryService categoryService;

    @Autowired
    public void ProductController(ProductService productService) {
        this.productService = productService;
    }

    @Autowired
    public void CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }


    @GetMapping("/")
    public String mainApplicationController(){
        return "FXStore server is live";
    }

    @GetMapping("/product")
    public List<Product> getAllProducts() {
        return productService.getAllProducts();
    }

    @PostMapping("/product")
    @ResponseBody
    public ResponseEntity<String> saveProduct(@RequestBody  List<Product> productRequests, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            StringBuilder errorMessage = new StringBuilder("Validation errors: ");
            bindingResult.getAllErrors().forEach(error -> errorMessage.append(error.getDefaultMessage()).append("; "));
            return ResponseEntity.badRequest().body(errorMessage.toString());
        }else {
            for (Product product : productRequests) {
                productService.saveProduct(product);
            }
            return ResponseEntity.ok("Products saved");

        }
    }

    @GetMapping("/category")
    public List<Category> getAllCategories() {
        return categoryService.getAllCategories();
    }


    @PostMapping("/category")
    @ResponseBody
    public ResponseEntity<String> saveCategory(@RequestBody  List<Category> categoryRequest, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            StringBuilder errorMessage = new StringBuilder("Validation errors: ");
            bindingResult.getAllErrors().forEach(error -> errorMessage.append(error.getDefaultMessage()).append("; "));
            return ResponseEntity.badRequest().body(errorMessage.toString());
        }else {
            for (Category category : categoryRequest) {
                categoryService.saveCategory(category);
            }
            return ResponseEntity.ok("Category saved");

        }
    }

}
