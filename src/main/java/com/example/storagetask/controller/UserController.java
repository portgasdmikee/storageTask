package com.example.storagetask.controller;

import com.example.storagetask.domain.User;
import com.example.storagetask.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
public class UserController {

    @Autowired
    private UserRepo userRepo;

    @GetMapping("/main")
    public String main(Model model, Principal principal) {

        User user = userRepo.findByUsername(principal.getName());
        boolean isStorage = user.getRole().equals("Кладовщик");
        model.addAttribute("user", user);


        return isStorage ? "redirect:/storageProducts" : "redirect:/providerProducts";

    }




}
