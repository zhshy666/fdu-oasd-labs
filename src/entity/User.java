package entity;

import java.sql.Timestamp;
import java.util.Date;

public class User {
    private String userName;
    private String email;
    private String password;
    private String state;
    private String dateJoined;
    private String dateLastModified;

    public User(String userName, String email, String password, String state, String dateJoined, String dateLastModified) {
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.state = state;
        this.dateJoined = dateJoined;
        this.dateLastModified = dateLastModified;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getDateJoined() {
        return dateJoined;
    }

    public String getDateLastModified() {
        return dateLastModified;
    }

    public void setDateJoined(String dateJoined) {
        this.dateJoined = dateJoined;
    }

    public void setDateLastModified(String dateLastModified) {
        this.dateLastModified = dateLastModified;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
