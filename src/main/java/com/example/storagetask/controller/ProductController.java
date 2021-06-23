package com.example.storagetask.controller;

import com.example.storagetask.domain.Product;
import com.example.storagetask.domain.User;
import com.example.storagetask.repository.UserRepo;
import com.example.storagetask.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private ProductService productService;

    @GetMapping("/sendProduct")
    public String newVacancy() {
        return "sendProduct";
    }

    @GetMapping("/providerProducts")
    public String providerProducts(Model model, Principal principal) {

        User user = userRepo.findByUsername(principal.getName());

        List<Product> products = productService.findByUserId(user);
        model.addAttribute("products", products);
        model.addAttribute("user", user);


        return "mainProvider";
    }

    @GetMapping("/storageProducts")
    public String storageProducts(Model model, Principal principal) {

        User user = userRepo.findByUsername(principal.getName());
        model.addAttribute("user", user);

        List<Product> products = productService.listAll();
        model.addAttribute("products", products);


        return "mainStorage";
    }

    @PostMapping("/receiveProduct")
    public String receiveProduct(@Valid Product product,
                                 Model model,
                                 Principal principal){

        User user = userRepo.findByUsername(principal.getName());
        productService.receiveProduct(product, user);
        model.addAttribute("user", user);

        List<Product> products = productService.listAll();
        model.addAttribute("products", products);

        return "redirect:/storageProducts";
    }


    @PostMapping("/sendProduct")
    public String sendProduct(
            @Valid Product product,
            Model model,
            Principal principal) {

        User user = userRepo.findByUsername(principal.getName());
        productService.sendProduct(product, user);
        model.addAttribute("user", user);

        return "redirect:/main";
    }

    @PostMapping("/deleteProduct")
    public String deleteProduct(
            @Valid Product product,
            Model model,
            Principal principal) {
        User user = userRepo.findByUsername(principal.getName());
        model.addAttribute("user", user);
        productService.deleteProduct(product);


        return "redirect:/main";
    }

}
