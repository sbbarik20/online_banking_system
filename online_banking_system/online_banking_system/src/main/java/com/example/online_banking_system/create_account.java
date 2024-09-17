package com.example.online_banking_system;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.sql.*;

@Controller
public class create_account {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PostMapping("/create_account")
    public String createAccountSave(Model m,
            @RequestParam("name") String name,
            @RequestParam("account_type") String accountType,
            @RequestParam("email") String email,
            @RequestParam("fathers_name") String fathersName,
            @RequestParam("mothers_name") String mothersName,
            @RequestParam("dob") String dob,
            @RequestParam("gender") String gender,
            @RequestParam("occupation") String occupation,
            @RequestParam("aadhar_no") String aadharNo,
            @RequestParam("mobile_no") String mobileNo,
            @RequestParam("marital_status") String maritalStatus,
            @RequestParam("pan_no") String panNo,
            @RequestParam("nationality") String nationality,
            @RequestParam("religion") String religion,
            @RequestParam("qualification") String qualification,
            @RequestParam("category") String category,
            @RequestParam("address") String address,
            @RequestParam("city") String city,
            @RequestParam("state") String state,
            @RequestParam("pin") String pin,
            @RequestParam("photo") MultipartFile photo) throws IOException, SQLException {

        String sql = "INSERT INTO create_account (name, account_type, email, fathers_name, mothers_name, dob, gender, occupation, aadhar_no, mobile_no, marital_status, pan_no, nationality, religion, qualification, category, address, city, state, pin, photo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Setting auto-generated keys retrieval flag
        PreparedStatement statement = jdbcTemplate.getDataSource().getConnection().prepareStatement(sql,
                Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, name);
        statement.setString(2, accountType);
        statement.setString(3, email);
        statement.setString(4, fathersName);
        statement.setString(5, mothersName);
        statement.setString(6, dob);
        statement.setString(7, gender);
        statement.setString(8, occupation);
        statement.setString(9, aadharNo);
        statement.setString(10, mobileNo);
        statement.setString(11, maritalStatus);
        statement.setString(12, panNo);
        statement.setString(13, nationality);
        statement.setString(14, religion);
        statement.setString(15, qualification);
        statement.setString(16, category);
        statement.setString(17, address);
        statement.setString(18, city);
        statement.setString(19, state);
        statement.setString(20, pin);
        statement.setBytes(21, photo.getBytes());

        statement.executeUpdate();

        // Retrieving auto-generated keys
        ResultSet rs = statement.getGeneratedKeys();
        if (rs.next()) {
            long accountNo = rs.getLong(1); // Using long instead of int
            m.addAttribute("accountNo", accountNo);
        } else {
            m.addAttribute("accountNo", "Not available");
        }

        m.addAttribute("sms",
                "Congratulations! You have Successfully created an account. And the account number of your account is:");
        return "create_account";
    }

    @GetMapping("/create_account")
    public static String create_account() {
        return "create_account";
    }
}
