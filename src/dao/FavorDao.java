package dao;

import entity.Image;

import java.sql.*;
import java.util.LinkedHashSet;
import java.util.Set;

public class FavorDao {
    private static final String DBU = "jdbc:mysql://localhost:3306/project?useSSL=true&serverTimezone=GMT";
    private static final String DBUSER = "root";
    private static final String DBUPASS = "zsy666";
    private static Connection connection = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultSet = null;

    public FavorDao(){

    }

    public Set<Image> findFavorImagesByUserId(int userId){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DBU, DBUSER, DBUPASS);
        }catch (Exception e){
            e.printStackTrace();
        }

        Set<Image> set = new LinkedHashSet<>();
        try {
            // TODO: 这里favors表是一个demo，本次lab测试用，写pj的时候记得改成助教给的那个travelimagefavor
            String sql = "select imageId from favors where userId = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            resultSet = statement.executeQuery();

            while (resultSet.next()){
                String sql2 = "select * from travelimage where ImageID = ?";
                statement = connection.prepareStatement(sql2);
                statement.setInt(1, resultSet.getInt("imageId"));
                ResultSet resultSet2 = statement.executeQuery();
                if (resultSet2.next()) {
                    // 构造 Image 对象并放入set集合中
                    Image image = new Image(
                            resultSet2.getInt("ImageId"),
                            resultSet2.getString("Title"),
                            resultSet2.getString("Description"),
                            resultSet2.getDouble("Latitude"),
                            resultSet2.getDouble("Longitude"),
                            resultSet2.getInt("CityCode"),
                            resultSet2.getString("Country_RegionCodeISO"),
                            resultSet2.getInt("UID"),
                            resultSet2.getString("PATH"),
                            resultSet2.getString("Content")
                    );
                    set.add(image);
                }
            }
        }catch (Exception e){
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
        return set;
    }
}
