package com.example.jspdemo.service;

import com.example.jspdemo.model.Client;
import com.example.jspdemo.repo.IClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ClientService {
    @Autowired
    IClientRepository clientrepo;
    public List<Client> getClientsByPassport(String passport) {
        return clientrepo.findByPassport(passport);
    }
    public List<Client> getAllClients(){
    List<Client> clientList = new ArrayList<>();
    clientrepo.findAll().forEach(client -> clientList.add(client));
        return  clientList;
}
public Client getClientById(Long id){
    return clientrepo.findById(id).get();
}
public boolean saveOrUpdateClient(Client client) {
    Client updatedClient = clientrepo.save(client);
    if (clientrepo.findById(updatedClient.getId()) != null) {
        return true;
    }
    return false;
}
    public boolean deleteClient(Long id) {
       clientrepo.deleteById(id);
        if (clientrepo.findById(id) != null) {
            return true;
        }
        return false;
    }
}
