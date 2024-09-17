package com.example.online_banking_system;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class bank {
    @Autowired
    JdbcTemplate jdbc;

    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    @PostMapping("/login")
    public String login_chk(Model m, HttpSession session, @RequestParam("email") String email,
            @RequestParam("password") String password) {
        ArrayList<String> ali = new ArrayList<String>();
        List<String> li = jdbc.query(
                "select * from register where email='" + email + "' and password='" + password + "' ",
                new RowMapper<String>() {
                    public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                        ali.add(rs.getString(1));
                        ali.add(rs.getString(2));
                        ali.add(rs.getString(3));
                        ali.add(rs.getString(4));
                        ali.add(rs.getString(5));
                        ali.add(rs.getString(6));
                        ali.add(rs.getString(7));
                        return "";
                    }
                });

        if (ali.isEmpty()) {
            m.addAttribute("sms", "Invalid Details");
            return "login";
        } else {
            if ((ali.get(6)).equalsIgnoreCase("1")) {
                session.setAttribute("name", ali.get(1));
                session.setAttribute("email", ali.get(2));
                session.setAttribute("accountno", ali.get(0));

                if ((ali.get(5)).equalsIgnoreCase("admin")) {
                    return "admindashboard";
                } else if ((ali.get(5)).equalsIgnoreCase("customer")) {
                    return "customerdashboard";
                } else {
                    return "/login";
                }
            } else {
                m.addAttribute("sms", "Please Contact Admin");
                return "/login";
            }

        }
    }

    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    @PostMapping("/contact_table")
    public String contact_table(Model m, @RequestParam("name") String name, @RequestParam("email") String email,
            @RequestParam("subject") String subject, @RequestParam("message") String message) {
        jdbc.execute("insert into contact_table (name,email,subject,message) values('" + name + "','" + email + "','"
                + subject + "','" + message + "')");
        m.addAttribute("sms", "Message Sent Successfully");
        return "/index";
    }

    @GetMapping("/login")
    public static String login() {
        return "login";
    }

    @GetMapping("/faq")
    public static String faq() {
        return "faq";
    }

    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @GetMapping("/admindashboard")
    public String admindashboard(Model model, HttpSession session, HttpServletRequest request) {
        String accountno = (String) request.getSession().getAttribute("accountno");
        String sql = "SELECT * FROM create_account WHERE accountno=?";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql, accountno);

        for (Map<String, Object> user : usermaster) {
            byte[] imageBytes = (byte[]) user.get("photo");
            if (imageBytes != null) {
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                user.put("photoBase64", base64Image);
            }
        }
        model.addAttribute("usermaster", usermaster);
        return "admindashboard";
    }

    @GetMapping("/customerdashboard")
    public String customerdashboard(Model model, HttpSession session, HttpServletRequest request) {
        String accountno = (String) request.getSession().getAttribute("accountno");
        String sql = "SELECT * FROM create_account WHERE accountno=?";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql, accountno);

        for (Map<String, Object> user : usermaster) {
            byte[] imageBytes = (byte[]) user.get("photo");
            if (imageBytes != null) {
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                user.put("photoBase64", base64Image);
            }
        }
        model.addAttribute("usermaster", usermaster);
        return "customerdashboard";
    }
}
