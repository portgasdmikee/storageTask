package com.example.storagetask.repository;

import com.example.storagetask.domain.Status;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StatusRepo extends JpaRepository<Status, Long> {



}
