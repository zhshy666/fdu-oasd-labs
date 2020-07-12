package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBUtil {
    private static final String DBU = "jdbc:mysql://localhost:3306/project?useSSL=true&serverTimezone=GMT";
    private static final String DBUSER = "root";
    private static final String DBUPASS = "zsy666";
    private static Connection connection = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultSet = null;

    public static Connection connectDB(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DBU, DBUSER, DBUPASS);
        }catch (Exception e){
            e.printStackTrace();
        }
        return connection;
    }
}
