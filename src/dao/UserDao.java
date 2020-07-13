package dao;

import java.sql.*;
import entity.User;
import util.DBUtil;

public class UserDao {
    private static Connection connection = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultSet = null;
    public UserDao(){

    }
    public boolean register(User u){
        connection = DBUtil.connectDB();

        boolean flag = false;
        try {
            String sql = "select * from traveluser where UserName = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, u.getUserName());
            resultSet = statement.executeQuery();
            // Check whether the user exists
            if(resultSet.next()){
                statement.close();
                connection.close();
                return false;
            }

            String sql2 = "insert into traveluser values (null, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql2);
            statement.setString(1,u.getEmail());
            statement.setString(2,u.getUserName());
            statement.setString(3,u.getPassword());
            statement.setString(4, u.getState());
            statement.setString(5, u.getDateJoined());
            statement.setString(6, u.getDateLastModified());
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
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    if(connection != null)
                        connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return flag;
    }

    public String login(String name, String password){
        connection = DBUtil.connectDB();

        String username = null;
        try {
            String sql = "select * from users where firstName = ? and password = ?";
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

    public int findUserIdByName(String username){
        connection = DBUtil.connectDB();

        int userId = -1;
        try {
            String sql = "select id from users where firstName = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            resultSet = statement.executeQuery();
            if(resultSet.next()){
                userId = resultSet.getInt(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                if(statement != null)
                    statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    if(connection != null)
                        connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return userId;
    }
}
