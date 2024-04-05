package com.example.jspdemo.service;

import com.example.jspdemo.model.Deposit;
import com.example.jspdemo.repo.IDepositRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DepositService {
    @Autowired
    IDepositRepository depositrepo;
    public List<Deposit> getDepositsByPassport(String passport) {
        return depositrepo.findByDepositName(passport);
    }
    public List<Deposit> getAllDeposits(){
        List<Deposit> depositList = new ArrayList<>();
        depositrepo.findAll().forEach(deposit -> depositList.add(deposit));
        return  depositList;
    }
    public Deposit getDepositById(Long id){
        return depositrepo.findById(id).get();
    }
    public boolean saveOrUpdateDeposit(Deposit deposit) {
        Deposit updatedDeposit = depositrepo.save(deposit);
        if (depositrepo.findById(updatedDeposit.getId()) != null) {
            return true;
        }
        return false;
    }
    public List<Deposit> getDepositsByDepositName(String depositName) {
        return depositrepo.findByDepositName(depositName);
    }
    public boolean deleteDeposit(Long id) {
        depositrepo.deleteById(id);
        if (depositrepo.findById(id) != null) {
            return true;
        }
        return false;
    }
}
