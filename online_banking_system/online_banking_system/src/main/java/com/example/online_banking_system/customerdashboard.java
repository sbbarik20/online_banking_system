package com.example.online_banking_system;

import java.sql.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class customerdashboard {

    @Autowired
    JdbcTemplate jdbc;

    @GetMapping("/profile")
    public String profile(Model model, HttpSession session, HttpServletRequest request) {
        String accountno = (String) request.getSession().getAttribute("accountno");
        String sql = "SELECT * FROM create_account WHERE accountno=?";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql, accountno);

        // Convert BLOB image data to base64
        for (Map<String, Object> user : usermaster) {
            byte[] imageBytes = (byte[]) user.get("photo");
            if (imageBytes != null) {
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                user.put("photoBase64", base64Image);
            }
        }

        model.addAttribute("usermaster", usermaster);
        return "profile";
    }

    @GetMapping("/check_account")
    public String check_account(Model model, HttpSession session, HttpServletRequest request) {
        String accountno = (String) request.getSession().getAttribute("accountno");
        String sql = "SELECT register.accountno FROM register INNER JOIN account_balance ON register.accountno = account_balance.accountno WHERE register.accountno = ?";
        List<Map<String, Object>> blnc = jdbc.queryForList(sql, accountno);
        model.addAttribute("blnc", blnc);
        return "/check_account";
    }

    @PostMapping("/chk_balance")
    public String chk_balance(@RequestParam("accountno") String accountno, Model model) {
        String sql = "SELECT * FROM register INNER JOIN account_balance ON register.accountno = account_balance.accountno WHERE register.accountno = ?";
        List<Map<String, Object>> blnc = jdbc.queryForList(sql, accountno);
        model.addAttribute("blnc", blnc);
        return "check_account";
    }

    @GetMapping("/transactions")
    public String transactions() {
        return "/transactions";
    }

    // DEPOSIT+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @GetMapping("/deposit")
    public static String deposit() {
        return "/deposit";
    }

    @PostMapping("/deposit_money")
    public String depositMoney(@RequestParam("dep_money") int depositAmount, HttpSession session,
            HttpServletRequest request, Model m) {
        String accountno = (String) request.getSession().getAttribute("accountno");
        String sql = "UPDATE account_balance SET balance = balance + ? WHERE accountno = ?";
        jdbc.update(sql, depositAmount, accountno);
        try {
            logTransaction_dep(accountno, accountno, 0, depositAmount);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        m.addAttribute("sms", "Money Deposited Successfully");
        return "/deposit";
    }

    private void logTransaction_dep(String fromAccount, String toAccount, double amount, double credit_amount)
            throws SQLException {
        String sqlInsertTransaction = "INSERT INTO transfer_details (from_account, to_account, amount,credit_amount) VALUES (?, ?, ?, ?)";
        try (Connection connection = jdbc.getDataSource().getConnection();
                PreparedStatement statement = connection.prepareStatement(sqlInsertTransaction)) {
            statement.setString(1, fromAccount);
            statement.setString(2, toAccount);
            statement.setDouble(3, amount);
            statement.setDouble(4, credit_amount);
            statement.executeUpdate();
        }
    }

    // WITHDRAW+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @GetMapping("/withdraw")
    public static String withdraw() {
        return "/withdraw";
    }

    @PostMapping("/withdraw_money")
    public String withdrawMoney(@RequestParam("accountno") String accountNo,
            @RequestParam("withdraw_amount") int withdrawAmount,
            Model m) {
        String checkBalanceSql = "SELECT balance FROM account_balance WHERE accountno = ?";
        Integer currentBalance = jdbc.queryForObject(checkBalanceSql, Integer.class, accountNo);
        if (currentBalance == null || currentBalance < withdrawAmount) {
            return "";
        }
        String updateBalanceSql = "UPDATE account_balance SET balance = balance - ? WHERE accountno = ?";
        jdbc.update(updateBalanceSql, withdrawAmount, accountNo);
        m.addAttribute("sms", "Money Withdraw Successfully");
        return "/withdraw";
    }

    // ADD BENEFICIARY=======================================================================================
    @GetMapping("/addbeneficiary")
    public String addbeneficiary(Model model,HttpSession session, HttpServletRequest request) {
        String accountno = (String) request.getSession().getAttribute("accountno");
        String sql = "SELECT * FROM beneficiary_list where myaccno='"+accountno+"'";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        model.addAttribute("usermaster", usermaster);
        System.out.println(usermaster);
        return "addbeneficiary";
    }

    @PostMapping("/dltbeneficiary")
    public String dltbeneficiary(Model model,@RequestParam("baccount") String baccount,HttpSession session,HttpServletRequest request) {
        String sql = "delete FROM beneficiary_list where baccount=?";
        jdbc.update(sql ,baccount);
        return addbeneficiary(model, session, request);
    }
    

    @PostMapping("/addbeneficiary")
    public String addBeneficiary(Model model, HttpServletRequest request,HttpSession session,
            @RequestParam("baccount") String baccount,
            @RequestParam("ahname") String ahname,
            @RequestParam("cnfacno") String cnfacno,
            @RequestParam("branch") String branch) {
        String accountno = (String) request.getSession().getAttribute("accountno");        
        String sql = "INSERT INTO beneficiary_list (myaccno,baccount, ahname, cnfacno,branch) VALUES (?,?, ?, ?, ?)";
        jdbc.update(sql,accountno, baccount, ahname, cnfacno, branch);
        return addbeneficiary(model, session, request);
    }

    @GetMapping("/getAccountHolderName")
    @ResponseBody
    public List getAccountHolderName(@RequestParam("baccount") String baccount) {
        String accountHolderName = "select * from register where accountno = '" + baccount + "' ";
        List<Map<String, Object>> li = jdbc.queryForList(accountHolderName);
        return li;
    }

    @GetMapping("/getaccountholdername")
    @ResponseBody
    public List getaccountholdername(
        @RequestParam("baccount") String baccount,HttpServletRequest request,HttpSession session) {
        String accountno = (String) request.getSession().getAttribute("accountno"); 
        String accountHolderName = "select * from beneficiary_list where baccount = '" + baccount + "' and myaccno='"+accountno+"' ";
        List<Map<String, Object>> li = jdbc.queryForList(accountHolderName);
        return li;
    }



    // MONEY TRANSFER========================================================================================
    @GetMapping("/sendmoney")
    public static String sendmoney() {
        return "/sendmoney";
    }

    @PostMapping("/transferMoney")
    public String sendMoney(String fromAccount, String toAccount, double amount, Model m, HttpSession session,
            HttpServletRequest request) {
        try {
            if (!accountExists(fromAccount) || !accountExists(toAccount)) {
                m.addAttribute("error", "Account number not found");
                return "/withdraw";
            }
            String sqlUpdateFrom = "UPDATE account_balance SET balance = balance - ? WHERE accountno = ?";
            String sqlUpdateTo = "UPDATE account_balance SET balance = balance + ? WHERE accountno = ?";

            try (Connection connection = jdbc.getDataSource().getConnection();
                    PreparedStatement updateFromStatement = connection.prepareStatement(sqlUpdateFrom);
                    PreparedStatement updateToStatement = connection.prepareStatement(sqlUpdateTo)) {

                connection.setAutoCommit(false);
                updateFromStatement.setDouble(1, amount);
                updateFromStatement.setString(2, fromAccount);
                updateFromStatement.executeUpdate();

                updateToStatement.setDouble(1, amount);
                updateToStatement.setString(2, toAccount);
                updateToStatement.executeUpdate();

                connection.commit();
            } catch (SQLException e) {
                Connection connection = jdbc.getDataSource().getConnection();
                if (connection != null) {
                    connection.rollback();
                }
                throw e;
            }

            // Log the transaction
            logTransaction(fromAccount, toAccount, amount);

            m.addAttribute("sms", "Money Transfer Successfully");
            return "/withdraw";
        } catch (SQLException e) {
            m.addAttribute("error", "An error occurred during the transaction: " + e.getMessage());
            return "/withdraw";
        }
    }

    private void logTransaction(String fromAccount, String toAccount, double amount) throws SQLException {
        String sqlInsertTransaction = "INSERT INTO transfer_details (from_account, to_account, amount) VALUES (?, ?, ?)";
        try (Connection connection = jdbc.getDataSource().getConnection();
                PreparedStatement statement = connection.prepareStatement(sqlInsertTransaction)) {
            statement.setString(1, fromAccount);
            statement.setString(2, toAccount);
            statement.setDouble(3, amount);
            statement.executeUpdate();
        }
    }

    private boolean accountExists(String accountNo) throws SQLException {
        String sqlCheckAccount = "SELECT COUNT(*) FROM account_balance WHERE accountno = ?";
        try (Connection connection = jdbc.getDataSource().getConnection();
                PreparedStatement statement = connection.prepareStatement(sqlCheckAccount)) {
            statement.setString(1, accountNo);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        }
        return false;
    }

    // @GetMapping("/ministatement")
    // public static String ministatement() {
    // return "/ministatement";
    // }

    // // @PostMapping("/ministatement")
    // // public static String ministatement_details() {
    // // return "/ministatement";
    // // }

    @GetMapping("/ministatement")
    public String ministatement(Model model, HttpSession session, HttpServletRequest request) {
        String accountno = (String) request.getSession().getAttribute("accountno");
        String sql = "SELECT * FROM transfer_details WHERE from_account = ?";
        List<Map<String, Object>> ministmt = jdbc.queryForList(sql, accountno);
        model.addAttribute("ministmt", ministmt);
        return "ministatement";
    }

}
