package com.example.storagetask.repository;

import com.example.storagetask.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepo extends JpaRepository<Product, Long> {

    @Query("SELECT p from Product p " +
            "INNER join User u ON p.id = u.id " +
            "where u.id = :id")
    List<Product> findByUserId(@Param("id") Long id);

}
