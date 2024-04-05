package com.example.jspdemo.model;

import javax.persistence.*;

@Entity
@Table(name = "deposits")
public class Deposit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "deposit_name")
    private String depositName;

    @Column(name = "duration")
    private Integer duration;

    @Column(name = "amount")
    private Double amount;

    @Column(name = "interest_calculation_type")
    private String interestCalculationType;

    @Column(name = "interest_rate")
    private Double interestRate;

    @Column(name = "currency")
    private String currency;

    public Deposit() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDepositName() {
        return depositName;
    }

    public void setDepositName(String depositName) {
        this.depositName = depositName;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getInterestCalculationType() {
        return interestCalculationType;
    }

    public void setInterestCalculationType(String interestCalculationType) {
        this.interestCalculationType = interestCalculationType;
    }

    public Double getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(Double interestRate) {
        this.interestRate = interestRate;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }
}
