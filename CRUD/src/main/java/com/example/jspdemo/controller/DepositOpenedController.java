package com.example.jspdemo.controller;

import com.example.jspdemo.model.Client;
import com.example.jspdemo.model.DepositOpened;
import com.example.jspdemo.service.DepositOpenedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Controller
public class DepositOpenedController {
    @Autowired
    DepositOpenedService depositOpenedService;

    @GetMapping("/ViewDepositOpenedList")
    public String ViewDepositOpened(@RequestParam(value = "location", required = false) String location, Model model) {
        List<DepositOpened> depositOpened;
        if (location != null) {
            // Получение фактов обработки для определенного клиента из сервиса
            depositOpened = depositOpenedService.getDepositOpenedByLocation(location);
        } else {
            // Получение всех фактов обработки из сервиса
            depositOpened = depositOpenedService.getAllDepositOpened();
        }

        if (depositOpened != null) {
            // Если список фактов успешно получен, добавляем сообщение об успешном выполнении
            model.addAttribute("message", "Get Success");
        } else {
            // Если список фактов не получен (например, из-за ошибки), добавляем сообщение об ошибке
            model.addAttribute("message", "Get Failure");
        }

        // Помещаем полученные данные в модель для передачи на страницу ViewDepositOpeneds.jsp
        model.addAttribute("depositOpened", depositOpened);

        // Возвращаем имя представления ViewDepositOpeneds.jsp
        return "ViewDepositOpenedList";
    }

    @GetMapping("/AddDepositOpened")
    public String AddDepositOpened(@ModelAttribute("message") String message,Model model) {
        model.addAttribute("depositOpened", new DepositOpened());
        model.addAttribute("message",message);
        return "AddDepositOpened";
    }

    @PostMapping("/saveDepositOpened")
    public String saveDepositOpened(DepositOpened depositOpened) {
        if (depositOpenedService.saveOrUpdateDepositOpened(depositOpened)) {
            return "redirect:/ViewDepositOpenedList";
        }
        return "redirect:/addDepositOpened";
    }

    @GetMapping("/editDepositOpened/{id}")
    public String editDepositOpened(@PathVariable Long id, Model model) {
        model.addAttribute("depositOpened", depositOpenedService.getDepositOpenedById(id));
        return "EditDepositOpened";
    }

    @PostMapping("/editSaveDepositOpened")
    public String editSaveDepositOpened(DepositOpened depositOpened, RedirectAttributes redirectAttributes) {
        if (depositOpenedService.saveOrUpdateDepositOpened(depositOpened)) {
            redirectAttributes.addFlashAttribute("message", "Edit Success");
            return "redirect:/ViewDepositOpenedList";
        }
        redirectAttributes.addFlashAttribute("message", "Edit Failure");
        return "redirect:/editDepositOpened/" + depositOpened.getId();
    }

    @GetMapping("/deleteDepositOpened/{id}")
    public String deleteDepositOpened(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        if (depositOpenedService.deleteDepositOpened(id)) {
            redirectAttributes.addFlashAttribute("message", "Delete Success");
        } else {
            redirectAttributes.addFlashAttribute("message", "Delete Failure");
        }
        return "redirect:/ViewDepositOpenedList";
    }
    @GetMapping("/getDepositOpenedByLocation")
    public String getDepositOpenedByLocation(@RequestParam(value = "location", required = false) String location, Model model) {
        List<DepositOpened> depositOpened;
        if (location != null&& !location.isEmpty()) {
            // Получение фактов лечения для определенного сотрудника из сервиса
            depositOpened = depositOpenedService.getDepositOpenedByLocation(location);
        } else {
            // Получение всех фактов лечения из сервиса
            depositOpened = depositOpenedService.getAllDepositOpened();
        }

        if (depositOpened != null) {
            // Если список фактов лечения успешно получен, добавляем сообщение об успешном выполнении
            model.addAttribute("message", "Get Success");
        } else {
            // Если список фактов лечения не получен (например, из-за ошибки), добавляем сообщение об ошибке
            model.addAttribute("message", "Get Failure");
        }

        // Помещаем полученные данные в модель для передачи на страницу ViewDepositOpeneds.jsp
        model.addAttribute("depositOpened", depositOpened);

        // Возвращаем имя представления ViewDepositOpeneds.jsp
        return "ViewDepositOpenedList";
    }

}
