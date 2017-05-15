/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class Item {

    private String cname;
    private int cquantity;
    private double cprice;

    public Item(String cname, int cquantity, double cprice){
	this.cname = cname;
	this.cquantity = cquantity;
        this.cprice = cprice;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public int getCquantity() {
        return cquantity;
    }

    public void setCquantity(int cquantity) {
        this.cquantity = cquantity;
    }

    public double getCprice() {
        return cprice;
    }

    public void setCprice(double cprice) {
        this.cprice = cprice;
    }

    

	

}