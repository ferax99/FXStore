package org.fernando.backend.service;

import org.fernando.backend.model.Category;
import org.fernando.backend.model.Product;
import org.fernando.backend.repository.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    private CategoryRepo categoryRepo;
    public List<Category> getAllCategories() {

        return categoryRepo.findAll().stream().toList();
    }

    public void saveCategory( Category category) {
        categoryRepo.save(category);
    }
}

