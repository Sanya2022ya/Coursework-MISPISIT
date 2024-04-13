package com.example.jspdemo.repo;

import com.example.jspdemo.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface IClientRepository extends JpaRepository<Client, Long> {
    List<Client> findByFio(String fio);
}
