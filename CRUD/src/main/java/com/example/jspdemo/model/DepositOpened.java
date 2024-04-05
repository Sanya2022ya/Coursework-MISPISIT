package com.example.jspdemo.model;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table(name = "deposits_opened")
public class DepositOpened {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "client_id")
    private Long clientId;

    @Column(name = "deposit_id")
    private Long depositId;

    @Column(name = "opening_date")
    private Date openingDate;

    @Column(name = "location")
    private String location;

    public DepositOpened() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getClientId() {
        return clientId;
    }

    public void setClientId(Long clientId) {
        this.clientId = clientId;
    }

    public Long getDepositId() {
        return depositId;
    }

    public void setDepositId(Long depositId) {
        this.depositId = depositId;
    }

    public Date getOpeningDate() {
        return openingDate;
    }

    public void setOpeningDate(Date openingDate) {
        this.openingDate = openingDate;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getOpeningDateStr() {
        if (this.openingDate != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            return dateFormat.format(this.openingDate);
        } else {
            return null; // или другое значение по умолчанию
        }
    }

    public void setOpeningDateStr(String openingDateStr) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            this.openingDate = dateFormat.parse(openingDateStr);
        } catch (Exception e) {
            // Обработка ошибок при парсинге строки в дату
            e.printStackTrace();
        }
    }
}
