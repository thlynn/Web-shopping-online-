/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Buying;
import model.Cart;
import model.Category;
import model.Customer;
import model.Order;
import model.Product;

/**
 *
 * @author dell
 */
public class DAO extends DBContext {

    public List<Cart> carts = new ArrayList<>();

    public Customer check(String username, String password) {
        String sql = "SELECT [CustomerName]\n"
                + "      ,[UserName]\n"
                + "      ,[Password]\n"
                + "      ,[Role]\n"
                + "  FROM [dbo].[Customer]"
                + "WHERE Username = ? AND Password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                // Create and return a Customer object
                String customerUsername = rs.getString("Username");
                String customerPassword = rs.getString("Password");
                String customerName = rs.getString("CustomerName");
                String role = rs.getString("Role");
                Customer customer = new Customer(customerUsername, customerPassword, customerName, role);
                return customer;
            }
        } catch (SQLException e) {
            // Handle the exception appropriately (e.g., log it)
            e.printStackTrace();
        }

        return null; // Return null if no matching customer is found
    }

    public void insert(Customer c) {
        String sql = "INSERT INTO [dbo].[Customer]\n"
                + "           ([CustomerName]\n"
                + "           ,[UserName]\n"
                + "           ,[Password]\n"
                + "           ,[Role])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getCustomerName());
            st.setString(2, c.getUsername());
            st.setString(3, c.getPassword());
            st.setString(4, c.getRole());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void insertProduct(Product p, Category c) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([ProductID]\n"
                + "           ,[ProductName]\n"
                + "           ,[Quantity]\n"
                + "           ,[Price]\n"
                + "           ,[image]\n"
                + "           ,[cid])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getProductID());
            st.setString(2, p.getProductName());
            st.setInt(3, p.getQuantity());
            st.setFloat(4, p.getPrice());
            st.setString(5, "image/vaytre1.jpg");
            st.setInt(6, c.getCategoryID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertBuying(Buying b, Category c) {
        String sql = "INSERT INTO [dbo].[Buying]\n"
                + "           ([AdminUserName]\n"
                + "           ,[ProductName]\n"
                + "           ,[Quantity]\n"
                + "           ,[Price]\n"
                + "           ,[image]\n"
                + "           ,[cid])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, b.getAdminUserName());
            st.setString(2, b.getProductName());
            st.setInt(3, b.getQuantity());
            st.setFloat(4, b.getPrice());
            st.setString(5, b.getImage());
            st.setInt(6, c.getCategoryID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertCart(Cart ca) {
        String sql = "INSERT INTO [dbo].[Cart]\n"
                + "           ([CartID]\n"
                + "           ,[ProductName]\n"
                + "           ,[Quantity]\n"
                + "           ,[UnitPrice]\n"
                + "           ,[TotalPrice])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ca.getCartID());
            st.setString(2, ca.getProductName());
            st.setInt(3, ca.getQuantity());
            st.setInt(4, ca.getUnitPrice());
            st.setInt(5, ca.getTotalPrice());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getMaxID() {
        int maxID = 0;
        String sql = "SELECT MAX(ProductID) FROM Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            // Check if there is at least one row in the ResultSet
            if (rs.next()) {
                maxID = rs.getInt(1);
            }
        } catch (SQLException e) {
            // Handle the exception appropriately, e.g., log or rethrow
            e.printStackTrace();
        }
        return maxID;
    }

    public void insertOrder(Order o) {
        String sql = "INSERT INTO [dbo].[OrderTable]\n"
                + "           ([OrderID]\n"
                + "           ,[CustomerName]\n"
                + "           ,[CustomerAddress]\n"
                + "           ,[PhoneNumber]\n"
                + "           ,[ProductName]\n"
                + "           ,[Quantity]\n"
                + "           ,[UnitPrice]\n"
                + "           ,[TotalPrice])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, o.getOrderID());
            st.setString(2, o.getCustomerName());
            st.setString(3, o.getCustomerAddress());
            st.setString(4, o.getPhoneNumber());
            st.setString(5, o.getProductName());
            st.setInt(6, o.getQuantity());
            st.setInt(7, o.getUnitPrice());
            st.setInt(8, o.getTotalPrice());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void removeCart(int cartID) {
        for (Cart c : carts) {
            if (c.getCartID() == cartID) {
                carts.remove(c);
            }
        }
    }

    public void deleteCart(int cartID) {
        String sql = "DELETE FROM [dbo].[Cart]\n"
                + "      WHERE CartID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean checkCustomerName(String Username) {
        String sql = "SELECT * FROM [dbo].[Customer] WHERE [Username] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Username);
            ResultSet rs = st.executeQuery();

            // Check if there is at least one row in the ResultSet
            if (rs.next()) {
                return true; // Customer with the given ID exists
            }
        } catch (SQLException e) {
            // Handle the exception appropriately, e.g., log or rethrow
            e.printStackTrace();
        }
        return false; // Customer with the given ID does not exist
    }

    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM [dbo].[Category] WHERE [CategoryID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("CategoryID"), rs.getString("CategoryName"));
                return c;

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> checkProductByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [ProductID]\n"
                + "      ,[ProductName]\n"
                + "      ,[Quantity]\n"
                + "      ,[Price]\n"
                + "      ,[image]\n"
                + "      ,[cid]\n"
                + "  FROM [dbo].[Product]"
                + "  where 1=1 and price>200000";
        if (cid != 0) {
            sql += " and cid=" + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //st.setInt(1, cid);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setPrice(rs.getFloat("Price"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCid(c);
                list.add(p);
            }
        } catch (SQLException e) {
            // Handle the exception appropriately (e.g., log it)
            e.printStackTrace();
        }

        return list;

    }

    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("CategoryID"), rs.getString("CategoryName"));
                list.add(c);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT [OrderID]\n"
                + "      ,[CustomerName]\n"
                + "      ,[CustomerAddress]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[ProductName]\n"
                + "      ,[Quantity]\n"
                + "      ,[UnitPrice]\n"
                + "      ,[TotalPrice]\n"
                + "  FROM [dbo].[OrderTable]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt("OrderID"), rs.getString("CustomerName"), rs.getString("CustomerAddress"),
                        rs.getString("PhoneNumber"), rs.getString("ProductName"), rs.getInt("Quantity"),
                        rs.getInt("UnitPrice"), rs.getInt("TotalPrice"));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Cart> getAllCart() {
        List<Cart> list = new ArrayList<>();
        String sql = "SELECT [CartID]\n"
                + "      ,[ProductName]\n"
                + "      ,[Quantity]\n"
                + "      ,[UnitPrice]\n"
                + "      ,[TotalPrice]\n"
                + "  FROM [dbo].[Cart]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = new Cart(rs.getInt("CartID"), rs.getString("ProductName"), rs.getInt("Quantity"),
                        rs.getInt("UnitPrice"), rs.getInt("TotalPrice"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> search(String key) {
        List<Product> list = new ArrayList<>();
        String sql = "Select * from Product where 1=1";
        if (key != null && !key.isEmpty()) {
            sql += " and (ProductName like ?)";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            if (key != null && !key.isEmpty()) {
                st.setString(1, "%" + key + "%");
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductName(rs.getString("ProductName"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setPrice(rs.getFloat("Price"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCid(c);
                list.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product checkProductByPid(int productID) {
        Product product = null;
        String sql = "SELECT [ProductID], [ProductName], [Quantity], [Price], [image], [cid] "
                + "FROM [dbo].[Product] WHERE ProductID = ?";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setPrice(rs.getFloat("Price"));
                product.setImage(rs.getString("image"));
                Category category = getCategoryById(rs.getInt("cid"));
                product.setCid(category);
            }
        } catch (SQLException e) {
            // Handle the exception appropriately (e.g., log it)
            e.printStackTrace();
        }

        return product;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setPrice(rs.getFloat("Price"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCid(c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Buying> getAllBuying() {
        List<Buying> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Buying]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Buying b = new Buying();
                b.setAdminUserName(rs.getString("AdminUserName"));
                b.setProductName(rs.getString("ProductName"));
                b.setQuantity(rs.getInt("Quantity"));
                b.setPrice(rs.getFloat("Price"));
                b.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                b.setCid(c);
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
