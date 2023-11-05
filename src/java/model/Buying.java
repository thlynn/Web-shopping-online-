/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Buying {
    private String AdminUserName;
    private String ProductName;
    private int Quantity;
    private float Price;
    private String image;
    private Category cid;

    public Buying() {
    }

    public Buying(String AdminUserName, String ProductName, int Quantity, float Price, String image, Category cid) {
        this.AdminUserName = AdminUserName;
        this.ProductName = ProductName;
        this.Quantity = Quantity;
        this.Price = Price;
        this.image = image;
        this.cid = cid;
    }

    public String getAdminUserName() {
        return AdminUserName;
    }

    public void setAdminUserName(String AdminUserName) {
        this.AdminUserName = AdminUserName;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Category getCid() {
        return cid;
    }

    public void setCid(Category cid) {
        this.cid = cid;
    }
    
}
