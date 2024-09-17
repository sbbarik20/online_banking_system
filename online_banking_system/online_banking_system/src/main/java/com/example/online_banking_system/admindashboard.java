package com.example.online_banking_system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class admindashboard {

    @Autowired
    JdbcTemplate jdbc;

    @GetMapping("/customeraccounts")
    public String customeraccounts(Model m) {
        
        String sql = "select * from create_account where name!='admin'";

        List<Map<String, Object>> li = jdbc.queryForList(sql);
        for (Map<String, Object> user : li) {
            byte[] imageBytes = (byte[]) user.get("photo");
            if (imageBytes != null) {
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                user.put("photoBase64", base64Image);
            }
        }

        m.addAttribute("li", li);
        return "customeraccounts";
    }

    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @GetMapping("/activeusers")
    public String activeusers(Model m) {
        String sql = "select * from register where role!='admin' AND status='1'";
        List<Map<String, Object>> li = jdbc.queryForList(sql);
        m.addAttribute("li", li);
        return "activeusers";
    }

    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @GetMapping("/customer")
    public String customer(Model model) {
        String sql = "select * from register where role!='admin'";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        model.addAttribute("usermaster", usermaster);
        return "customer";
    }
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    @PostMapping("/manageuser")
    public String manageuser(@RequestParam("email") String email, @RequestParam("btn") String btn, Model model) {
        if (btn.equalsIgnoreCase("Delete")) {
            String sql = "delete from register where email=?";
            jdbc.update(sql, email);
            return customer(model);
        }
        String sql = "select * from register where email='" + email + "'";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        model.addAttribute("usermaster", usermaster);
        return "edituser";
    }

    @PostMapping("/updateuser")
    public String updateuser(@RequestParam("email") String email, @RequestParam("name") String name,
            @RequestParam("role") String role, @RequestParam("status") String status, Model model) {
        String sql = "update register set name=?, role=?, status=? where email=?";
        jdbc.update(sql, name, role, status, email);
        return customer(model);
    }

    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @GetMapping("/message")
    public String message(Model model) {
        // System.out.println("User Page");
        String sql = "select * from contact_table ";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        model.addAttribute("usermaster", usermaster);
        return "message";
    }

    

    // FAQ
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    @GetMapping("/faq_admin")
    public String faq_admin(Model model){
        String sql = "select * from faq ";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        model.addAttribute("usermaster", usermaster);
        return "/faq_admin";
    }

    @PostMapping("/managefaq")
    public String managefaq(@RequestParam("slno") Integer slno, @RequestParam("btn") String btn, Model model) {
        if (btn.equalsIgnoreCase("Delete")) {
            String sql = "delete from faq where slno=?";
            jdbc.update(sql, slno);
            return faq_admin(model);
        }
        String sql = "select * from faq where slno='" + slno + "'";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        model.addAttribute("usermaster", usermaster);
        return "editfaq";
    }

    @PostMapping("/updatefaq")
    public String updatefaq(@RequestParam("slno") Integer slno, 
            @RequestParam("question") String question,
            @RequestParam("answer") String answer,Model model) {
        String sql = "update faq set question=?, answer=? where slno=?";
        jdbc.update(sql, question, answer, slno);
        return faq_admin(model);
    }

    @PostMapping("/addfaq")
    public String addfaq(
        @RequestParam("question") String question, 
        @RequestParam("answer") String answer,
        Model model) {
        String sql = " INSERT INTO faq (question,answer) VALUES (?,?)";
        jdbc.update(sql, question, answer);
        return faq_admin(model);
    }
}
