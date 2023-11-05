package model;

public class Cart {
    /*create table Cart(
CartID int NOT NULL primary key,
ProductName varchar(255),
Quantity int,
UnitPrice int,
TotalPrice int
)
     */
    private int CartID;
    private String ProductName;
    private int Quantity;
    private int UnitPrice;
    private int TotalPrice;

    public Cart() {
    }

    public Cart(int CartID, String ProductName, int Quantity, int UnitPrice, int TotalPrice) {
        this.CartID = CartID;
        this.ProductName = ProductName;
        this.Quantity = Quantity;
        this.UnitPrice = UnitPrice;
        this.TotalPrice = TotalPrice;
    }

    public int getCartID() {
        return CartID;
    }

    public void setCartID(int CartID) {
        this.CartID = CartID;
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

    public int getUnitPrice() {
        return UnitPrice;
    }

    public void setUnitPrice(int UnitPrice) {
        this.UnitPrice = UnitPrice;
    }

    public int getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(int TotalPrice) {
        this.TotalPrice = TotalPrice;
    }
    
}
