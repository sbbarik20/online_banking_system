package com.example.online_banking_system;

import java.io.IOException;
import java.sql.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class register {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PostMapping("/register")
    public String customer_register(Model m,
            @RequestParam("accountno") String accountno,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("cpassword") String cpassword) throws IOException, SQLException {

        String sqlSelect = "SELECT accountno, name, email FROM create_account WHERE accountno = ? AND name = ? AND email = ?";
        String sqlInsert = "INSERT INTO register (accountno, name, email, password, cpassword) VALUES (?, ?, ?, ?, ?)";
        String sqlInsertBalance = "INSERT INTO account_balance (accountno, balance) VALUES (?, ?)";

        try (
                Connection connection = jdbcTemplate.getDataSource().getConnection();
                PreparedStatement selectStatement = connection.prepareStatement(sqlSelect);
                PreparedStatement insertStatement = connection.prepareStatement(sqlInsert);
                PreparedStatement insertBalanceStatement = connection.prepareStatement(sqlInsertBalance);) {
            selectStatement.setString(1, accountno);
            selectStatement.setString(2, name);
            selectStatement.setString(3, email);
            ResultSet resultSet = selectStatement.executeQuery();
            if (resultSet.next()) {
                String retrievedAccountno = resultSet.getString("accountno");
                String retrievedName = resultSet.getString("name");
                String retrievedEmail = resultSet.getString("email");

                insertStatement.setString(1, retrievedAccountno);
                insertStatement.setString(2, retrievedName);
                insertStatement.setString(3, retrievedEmail);
                insertStatement.setString(4, password);
                insertStatement.setString(5, cpassword);

                insertStatement.executeUpdate();

                insertBalanceStatement.setString(1, retrievedAccountno);
                insertBalanceStatement.setDouble(2, 0.0);
                insertBalanceStatement.executeUpdate();

                m.addAttribute("sms", "Registration Successful");
            } else {
                m.addAttribute("sms", "Account not found");
            }
        }

        return "/register";
    }

    @GetMapping("/register")
    public static String register() {
        return "register";
    }
}
