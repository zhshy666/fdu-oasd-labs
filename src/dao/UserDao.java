package dao;

import java.sql.*;
import entity.User;

public class UserDao {
    private static final String DBU = "jdbc:mysql://localhost:3306/project?useSSL=true&serverTimezone=GMT";
    private static final String DBUSER = "root";
    private static final String DBUPASS = "zsy666";
    private static Connection connection = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultSet = null;
    public UserDao(){

    }
    public boolean register(User u){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DBU, DBUSER, DBUPASS);
        }catch (Exception e){
            e.printStackTrace();
        }

        boolean flag = false;
        try {
            String sql = "select * from user where firstName = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, u.getFirstName());
            resultSet = statement.executeQuery();
            // Check whether the user exists
            if(resultSet.next()){
                statement.close();
                connection.close();
                return false;
            }

            String sql2 = "insert into user values (null, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql2);
            statement.setString(1,u.getFirstName());
            statement.setString(2,u.getLastName());
            statement.setString(3,u.getEmail());
            statement.setString(4,u.getPassword());
            int result = statement.executeUpdate();

            if(result > 0){
                flag = true;
                System.out.println("Insert success");
            }else{
                System.out.println("Fail to insert");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if(statement != null)
                    statement.close();
                if(connection != null)
                    connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        return flag;
    }

    public String login(String name, String password){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DBU, DBUSER, DBUPASS);
        }catch (Exception e){
            e.printStackTrace();
        }

        String username = null;
        try {
            String sql = "select * from user where firstName = ? and password = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, password);
            resultSet = statement.executeQuery();

            if(resultSet.next()){
                System.out.println("Login success.");
                username = name;
            }else{
                System.out.println("Fail to login.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if(statement != null)
                    statement.close();
                if(connection != null)
                    connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return username;
    }
}