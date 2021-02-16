package db;

import com.mysql.cj.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBmanager {
    private static Connection connection;;
    static {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/firstEE_db?useUnicode=true&serverTimezone=UTC",
                    "root","");
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
    public static Countries getCountry(Long id){
        Countries country=new Countries();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("SELECT *from countries where id=?");
            preparedStatement.setLong(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();

            if (resultSet.next()){
                country=new Countries(resultSet.getLong("id"),resultSet.getString("name")
                        ,resultSet.getString("short_name"));
            }
            preparedStatement.close();
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return country;
    }
    public static ArrayList<Countries>getCountries(){
        ArrayList<Countries>countries=new ArrayList<>();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("SELECT *from countries");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                countries.add(new Countries(resultSet.getLong("id"),resultSet.getString("name")
                ,resultSet.getString("short_name")));
            }
            preparedStatement.close();
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return countries;
    }
    public static void deleteItem(Long id){
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("DELETE FROM items where id="+id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
    public static boolean  addItem(Items item){
        int rows=0;
         try{
             PreparedStatement preparedStatement=connection.prepareStatement("INSERT INTO items values(null, ?,?,?,?)");
             preparedStatement.setString(1,item.getName());
             preparedStatement.setInt(2,item.getPrice());
             preparedStatement.setInt(3,item.getAmount());
             preparedStatement.setLong(4,item.getManufacturer().getId());
             rows=preparedStatement.executeUpdate();
             preparedStatement.close();
         }catch (Exception ex){
             ex.printStackTrace();
         }
         return rows>0;
    }
    public static ArrayList<Items>getItems(){
        ArrayList<Items>items=new ArrayList<>();
        try{
            PreparedStatement preparedStatement=connection.prepareStatement("SELECT it.id, it.name, it.price, it.amount, it.manufacturer_id, co.name as countryName, co.short_name FROM items it" +
                    "                            INNER JOIN countries co ON it.manufacturer_id = co.id;");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                Long id=resultSet.getLong("id");
                String name=resultSet.getString("name");
                int price=resultSet.getInt("price");
                int amount=resultSet.getInt("amount");
                items.add(new Items(id,name,price,amount,new Countries(
                        resultSet.getLong("manufacturer_id"),
                        resultSet.getString("countryName"),resultSet.getString("short_name")
                )));
            }
            preparedStatement.close();
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return items;
    }
    public static boolean saveItem(Items item){
        int rows=0;
        try {
             PreparedStatement preparedStatement=connection.prepareStatement("UPDATE items SET name=?, price=?, amount=?, manufacturer_id=? where id=?;");
             preparedStatement.setString(1,item.getName());
             preparedStatement.setInt(2,item.getPrice());
             preparedStatement.setInt(3,item.getAmount());
             preparedStatement.setLong(4,item.getManufacturer().getId());
             preparedStatement.setLong(5,item.getId());
             rows=preparedStatement.executeUpdate();
             preparedStatement.close();
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return rows>0;
    }
    public static Items getItem(Long id){
        Items item=null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("SELECT it.id, it.name, it.price, it.amount,it.manufacturer_id, co.name as countryName, co.short_name FROM items it" +
                    " INNER JOIN countries co ON it.manufacturer_id = co.id where it.id=?;");
            preparedStatement.setLong(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            if (resultSet.next()){
                item=new Items(resultSet.getLong("id"), resultSet.getString("name")
                ,resultSet.getInt("price"), resultSet.getInt("amount"),new Countries(resultSet.getLong("manufacturer_id"),
                        resultSet.getString("countryName"),resultSet.getString("short_name")));
            }
            preparedStatement.close();
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return item;
    }

    public static Users getUser(String email){
        Users user=null;
        try {
             PreparedStatement preparedStatement=connection.prepareStatement("SELECT * FROM users WHERE email=?;");
             preparedStatement.setString(1,email);
             ResultSet resultSet=preparedStatement.executeQuery();
             if (resultSet.next()){
                 user=new Users(resultSet.getLong("id"),
                         resultSet.getString("email"),
                         resultSet.getString("password"),resultSet.getString("fullname"));
             }
            preparedStatement.close();
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return user;
    }

    public static void registerUser(Users users){
        try {
             PreparedStatement preparedStatement=connection.prepareStatement("INSERT INTO users VALUES(null,?,?,?);");
             preparedStatement.setString(1,users.getEmail());
             preparedStatement.setString(2,users.getPassword());
             preparedStatement.setString(3,users.getFullname());
             preparedStatement.executeUpdate();
             preparedStatement.close();
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
}
