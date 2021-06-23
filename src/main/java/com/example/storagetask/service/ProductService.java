package com.example.storagetask.service;

import com.example.storagetask.domain.Product;
import com.example.storagetask.domain.Status;
import com.example.storagetask.domain.User;
import com.example.storagetask.repository.ProductRepo;
import com.example.storagetask.repository.StatusRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.Date;
import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private StatusRepo statusRepo;

    public void sendProduct(Product product, User user) {

        Status status = statusRepo.findById(1L).orElse(null);
        product.setName(product.getName());
        product.setAmount(product.getAmount());
        product.setDateSend(new Date());
        product.setUser(user);
        product.setStatus(status);

        productRepo.save(product);
    }

    public void receiveProduct(Product product, User user) {

        Status status = statusRepo.findById(2L).orElse(null);
        product.setDatereceive(new Date());
        product.setStatus(status);

        productRepo.save(product);
    }

    public List<Product> findByUserId(User user) {

        List<Product> products = productRepo.findByUserId(user.getId());

        return products;
    }

    public List<Product> listAll(){

        return productRepo.findAll();
    }

    public void deleteProduct(Product product) {
        productRepo.delete(product);
    }


}
