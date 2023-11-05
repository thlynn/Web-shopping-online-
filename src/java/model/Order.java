
package model;

public class Order {
    private int OrderID;
    private String CustomerName;
    private String CustomerAddress;
    private String PhoneNumber;
    private String ProductName;
    private int Quantity;
    private int UnitPrice;
    private int TotalPrice;

    public Order() {
    }

    public Order(int OrderID, String CustomerName, String CustomerAddress, String PhoneNumber, String ProductName, int Quantity, int UnitPrice, int TotalPrice) {
        this.OrderID = OrderID;
        this.CustomerName = CustomerName;
        this.CustomerAddress = CustomerAddress;
        this.PhoneNumber = PhoneNumber;
        this.ProductName = ProductName;
        this.Quantity = Quantity;
        this.UnitPrice = UnitPrice;
        this.TotalPrice = TotalPrice;
    }

    

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
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

    public String getCustomerAddress() {
        return CustomerAddress;
    }

    public void setCustomerAddress(String CustomerAddress) {
        this.CustomerAddress = CustomerAddress;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }
    
}
