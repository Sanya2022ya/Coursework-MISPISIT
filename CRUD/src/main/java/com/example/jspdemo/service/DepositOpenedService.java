package com.example.jspdemo.service;

import com.example.jspdemo.model.DepositOpened;
import com.example.jspdemo.repo.IDepositOpenedRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DepositOpenedService {

    @Autowired
    IDepositOpenedRepository depositOpenedRepository;

    public List<DepositOpened> getAllDepositOpened() {
        List<DepositOpened> depositOpened = new ArrayList<>();
        depositOpenedRepository.findAll().forEach(depositOpened::add);
        return depositOpened;
    }

    public DepositOpened getDepositOpenedById(Long id) {
        return depositOpenedRepository.findById(id).get();
    }

    public boolean saveOrUpdateDepositOpened(DepositOpened depositOpened) {
        DepositOpened updatedDepositOpened = depositOpenedRepository.save(depositOpened);
        return depositOpenedRepository.findById(updatedDepositOpened.getId()).isPresent();
    }

    public boolean deleteDepositOpened(Long id) {
        depositOpenedRepository.deleteById(id);
        return !depositOpenedRepository.findById(id).isPresent();
    }
    public List<DepositOpened> getDepositOpenedByLocation(String location) {
        return depositOpenedRepository.findByLocation(location);
    }
}
