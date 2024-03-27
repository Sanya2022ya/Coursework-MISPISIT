package com.example.jspdemo.model;

import javax.persistence.*;

@Entity
@Table(name="clients")
public class Client {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
@Column
    private String passport;
@Column
    private String ticket_number;
@Column
    private String client_category;

public Client(){

}
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public String getTicket_number() {
        return ticket_number;
    }

    public void setTicket_number(String ticket_number) {
        this.ticket_number = ticket_number;
    }

    public String getClient_category() {
        return client_category;
    }

    public void setClient_category(String client_category) {
        this.client_category = client_category;
    }
}
