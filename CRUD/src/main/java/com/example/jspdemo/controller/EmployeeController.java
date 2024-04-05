package com.example.jspdemo.controller;

import com.example.jspdemo.model.Employee;
import com.example.jspdemo.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    @GetMapping({"/viewEmployeeList"})
    public String viewEmployeeList(@ModelAttribute("message")String message, Model model){
        getEmployeesByPassport("", model);
        model.addAttribute("employeeList",employeeService.getAllEmployees());
        model.addAttribute("message", message);
        return "ViewEmployeeList";
    }
    @GetMapping({"/AddEmployee"})
    public String AddEmployee(@ModelAttribute("message") String message,Model model){
        model.addAttribute("employee",new Employee());
        model.addAttribute("message",message);
        return "AddEmployee";
    }

    @PostMapping("/saveEmployee")
    public String saveEmployee(Employee employee, RedirectAttributes redirectAttributes){
        if (employeeService.saveOrUpdateEmployee(employee)){
            redirectAttributes.addFlashAttribute("message", "Save Success");
            return "redirect:/viewEmployeeList";
        }
        redirectAttributes.addFlashAttribute("message","Save Failure");
        return "redirect:/AddEmployee";
    }

    @GetMapping("/editEmployee/{id}")
    public String editEmployee(@PathVariable Long id, Model model){
    model.addAttribute("employee",employeeService.getEmployeeById(id));
    return "EditEmployee";
    }
    @PostMapping("/editSaveEmployee")
    public String editSaveEmployee(Employee employee, RedirectAttributes redirectAttributes) {
        if (employeeService.saveOrUpdateEmployee(employee)) {
            redirectAttributes.addFlashAttribute("message", "Edit Success");
            return "redirect:/viewEmployeeList";
        }

        redirectAttributes.addFlashAttribute("message", "Edit Failure");
        return "redirect:/editEmployee/" + employee.getId();
    }
    @GetMapping("/deleteEmployee/{id}")
    public String deleteEmployee(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        if (employeeService.deleteEmployee(id)) {
            redirectAttributes.addFlashAttribute("message", "Delete Success");
        } else {
            redirectAttributes.addFlashAttribute("message", "Delete Failure");
        }

        return "redirect:/viewEmployeeList";
    }

    @GetMapping("/getEmployeesByPassport")
    public String getEmployeesByPassport(@RequestParam(value = "fio", required = false) String fio, Model model) {
        List<Employee> employees;
        if (fio != null && !fio.isEmpty()) {
            // Получение клиентов с указанным номером паспорта из сервиса
            employees = employeeService.getEmployeesByFio(fio);
        } else {
            // Получение всех клиентов из сервиса
            employees = employeeService.getAllEmployees();
        }

        if (employees != null) {
            // Если список клиентов успешно получен, добавляем сообщение об успешном выполнении
            model.addAttribute("message", "Get Success");
        } else {
            // Если список клиентов не получен (например, из-за ошибки), добавляем сообщение об ошибке
            model.addAttribute("message", "Get Failure");
        }

        // Помещаем полученные данные в модель для передачи на страницу ViewEmployeeList.jsp
        model.addAttribute("employees", employees);

        // Возвращаем имя представления ViewEmployeeList.jsp
        return "ViewEmployeeList";
    }


}
