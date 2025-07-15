package com.example.demo.controller;

import com.example.demo.entity.Employee;
import com.example.demo.service.EmployeeService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("employee", new Employee());
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("employee") Employee employee,
                        @RequestParam("role") String role,
                        HttpSession session,
                        Model model) {
        Employee authenticated = employeeService.authenticate(employee.getUsername(), employee.getPassword());

        if (authenticated != null && authenticated.getRole().equalsIgnoreCase(role)) {
            session.setAttribute("loggedInUser", authenticated);
            session.setAttribute("loggedInRole", authenticated.getRole());
            return "redirect:/";
        } else {
            model.addAttribute("error", "Invalid username, password, or role.");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/employee/login";
    }

    @GetMapping("/")
    public String viewHome(Model model, HttpSession session) {
        model.addAttribute("listEmployees", employeeService.getAllEmployees());
        model.addAttribute("loggedInRole", session.getAttribute("loggedInRole"));
        return "index";
    }

    @GetMapping("/showNewEmployeeForm")
    public String showNewEmployeeForm(Model model) {
        model.addAttribute("employee", new Employee());
        return "new_employee";
    }

    @PostMapping("/saveEmployee")
    public String saveEmployee(@ModelAttribute("employee") Employee employee) {
        employeeService.saveEmployee(employee);
        return "redirect:/employee/";
    }

    @GetMapping("/showFormForUpdate/{id}")
    public String showFormForUpdate(@PathVariable("id") Long id, Model model) {
        Employee employee = employeeService.getEmployeeById(id);
        model.addAttribute("employee", employee);
        return "update_employee";
    }

    @GetMapping("/deleteEmployee/{id}")
    public String deleteEmployee(@PathVariable("id") Long id) {
        employeeService.deleteEmployee(id);
        return "redirect:/employee/";
    }

    @GetMapping("/search")
    public String search(@RequestParam("keyword") String keyword, Model model, HttpSession session) {
        model.addAttribute("listEmployees", employeeService.searchByName(keyword));
        model.addAttribute("loggedInRole", session.getAttribute("loggedInRole"));
        return "index";
    }
}
