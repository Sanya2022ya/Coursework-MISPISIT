package com.example.jspdemo.repo;

import com.example.jspdemo.model.Deposit;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IDepositRepository extends JpaRepository<Deposit, Long> {
    List<Deposit> findByDepositName(String depositName);
}
