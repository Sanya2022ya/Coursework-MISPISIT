package com.example.jspdemo.repo;

import com.example.jspdemo.model.DepositOpened;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public interface IDepositOpenedRepository extends JpaRepository<DepositOpened, Long> {
    List<DepositOpened> findByLocation(String location);
}
