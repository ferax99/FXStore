package org.fernando.backend.service;

import org.fernando.backend.model.Product;
import org.fernando.backend.repository.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public  class ProductService {
    @Autowired
    private ProductRepo productRepository;
    public  List<Product> getAllProducts() {

        return productRepository.findAll().stream().toList();
    }


    public void saveProduct( Product product) {
        productRepository.save(product);
    }
   

}
