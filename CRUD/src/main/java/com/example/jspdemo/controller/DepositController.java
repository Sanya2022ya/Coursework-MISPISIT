package com.example.jspdemo.controller;

import com.example.jspdemo.model.Deposit;
import com.example.jspdemo.service.DepositService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class DepositController {
    @Autowired
    DepositService depositService;

    @GetMapping({"/viewDepositList"})
    public String viewDepositList(@ModelAttribute("message")String message, Model model){
        getDepositsByDepositName("", model);
        model.addAttribute("depositList",depositService.getAllDeposits());
        model.addAttribute("message", message);
        return "ViewDepositList";
    }
    @GetMapping({"/AddDeposit"})
    public String AddDeposit(@ModelAttribute("message") String message,Model model){
        model.addAttribute("deposit",new Deposit());
        model.addAttribute("message",message);
        return "AddDeposit";
    }

    @PostMapping("/saveDeposit")
    public String saveDeposit(Deposit deposit, RedirectAttributes redirectAttributes){
        if (depositService.saveOrUpdateDeposit(deposit)){
            redirectAttributes.addFlashAttribute("message", "Save Success");
            return "redirect:/viewDepositList";
        } else {
            redirectAttributes.addFlashAttribute("message", "Save Failure");
            return "redirect:/AddDeposit";
        }
    }


    @GetMapping("/editDeposit/{id}")
    public String editDeposit(@PathVariable Long id, Model model){
    model.addAttribute("deposit",depositService.getDepositById(id));
    return "EditDeposit";
    }
    @PostMapping("/editSaveDeposit")
    public String editSaveDeposit(Deposit deposit, RedirectAttributes redirectAttributes) {
        if (depositService.saveOrUpdateDeposit(deposit)) {
            redirectAttributes.addFlashAttribute("message", "Edit Success");
            return "redirect:/viewDepositList";
        }

        redirectAttributes.addFlashAttribute("message", "Edit Failure");
        return "redirect:/editDeposit/" + deposit.getId();
    }
    @GetMapping("/deleteDeposit/{id}")
    public String deleteDeposit(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        if (depositService.deleteDeposit(id)) {
            redirectAttributes.addFlashAttribute("message", "Delete Success");
        } else {
            redirectAttributes.addFlashAttribute("message", "Delete Failure");
        }

        return "redirect:/viewDepositList";
    }

    @GetMapping("/getDepositsByDepositName")
    public String getDepositsByDepositName(@RequestParam(value = "depositName", required = false) String depositName, Model model) {
        List<Deposit> deposits;
        if (depositName != null && !depositName.isEmpty()) {
            // Получение депозитов с указанным именем из сервиса
            deposits = depositService.getDepositsByDepositName(depositName);
        } else {
            // Получение всех депозитов из сервиса
            deposits = depositService.getAllDeposits();
        }

        if (deposits != null) {
            // Если список депозитов успешно получен, добавляем сообщение об успешном выполнении
            model.addAttribute("message", "Get Success");
        } else {
            // Если список депозитов не получен (например, из-за ошибки), добавляем сообщение об ошибке
            model.addAttribute("message", "Get Failure");
        }

        // Помещаем полученные данные в модель для передачи на страницу ViewDepositList.jsp
        model.addAttribute("deposits", deposits);

        // Возвращаем имя представления ViewDepositList.jsp
        return "ViewDepositList";
    }



}
