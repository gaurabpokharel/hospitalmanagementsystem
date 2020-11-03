/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.method;

/**
 *
 * @author Gaurab Pokharel
 */
public class cashierBean {

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOamount() {
        return oamount;
    }

    public void setOamount(int oamount) {
        this.oamount = oamount;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }
    private int id,oamount;
    private String amount,depositamount;

    public String getDepositamount() {
        return depositamount;
    }

    public void setDepositamount(String depositamount) {
        this.depositamount = depositamount;
    }

    
}
