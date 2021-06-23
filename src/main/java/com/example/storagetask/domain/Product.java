package com.example.storagetask.domain;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private int amount;
    private Date dateSend;
    private Date dateReceive;
    @ManyToOne( cascade = CascadeType.PERSIST)
    @JoinColumn(name = "status_id")
    private Status status;

    @ManyToOne( cascade = CascadeType.PERSIST)
    @JoinColumn(name = "user_id")
    private User user;

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Date getDateSend() {
        return dateSend;
    }

    public void setDateSend(Date dateSend) {
        this.dateSend = dateSend;
    }

    public Date getDatereceive() {
        return dateReceive;
    }

    public void setDatereceive(Date datereceive) {
        this.dateReceive = datereceive;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
