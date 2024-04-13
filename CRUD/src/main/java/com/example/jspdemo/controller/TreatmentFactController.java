package com.example.jspdemo.controller;

import com.example.jspdemo.model.Client;
import com.example.jspdemo.model.TreatmentFact;
import com.example.jspdemo.service.TreatmentFactService;
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
public class TreatmentFactController {
    @Autowired
    TreatmentFactService treatmentFactService;

    @GetMapping("/ViewTreatmentFactsList")
    public String ViewTreatmentFacts(@RequestParam(value = "clientId", required = false) String clientId, Model model) {
        List<TreatmentFact> treatmentFacts;
        if (clientId != null) {
            // Получение фактов обработки для определенного клиента из сервиса
            treatmentFacts = treatmentFactService.getTreatmentFactsByEmployeeId(clientId);
        } else {
            // Получение всех фактов обработки из сервиса
            treatmentFacts = treatmentFactService.getAllTreatmentFacts();
        }

        if (treatmentFacts != null) {
            // Если список фактов успешно получен, добавляем сообщение об успешном выполнении
            model.addAttribute("message", "Get Success");
        } else {
            // Если список фактов не получен (например, из-за ошибки), добавляем сообщение об ошибке
            model.addAttribute("message", "Get Failure");
        }

        // Помещаем полученные данные в модель для передачи на страницу ViewTreatmentFacts.jsp
        model.addAttribute("treatmentFacts", treatmentFacts);

        // Возвращаем имя представления ViewTreatmentFacts.jsp
        return "ViewTreatmentFactsList";
    }

    @GetMapping("/AddTreatmentFact")
    public String AddTreatmentFact(@ModelAttribute("message") String message,Model model) {
        model.addAttribute("treatmentFact", new TreatmentFact());
        model.addAttribute("message",message);
        return "AddTreatmentFact";
    }

    @PostMapping("/saveTreatmentFact")
    public String saveTreatmentFact(TreatmentFact treatmentFact) {
        if (treatmentFactService.saveOrUpdateTreatmentFact(treatmentFact)) {
            return "redirect:/ViewTreatmentFactsList";
        }
        return "redirect:/addTreatmentFact";
    }

    @GetMapping("/editTreatmentFact/{id}")
    public String editTreatmentFact(@PathVariable Long id, Model model) {
        model.addAttribute("treatmentFact", treatmentFactService.getTreatmentFactById(id));
        return "EditTreatmentFact";
    }

    @PostMapping("/editSaveTreatmentFact")
    public String editSaveTreatmentFact(TreatmentFact treatmentFact, RedirectAttributes redirectAttributes) {
        if (treatmentFactService.saveOrUpdateTreatmentFact(treatmentFact)) {
            redirectAttributes.addFlashAttribute("message", "Edit Success");
            return "redirect:/ViewTreatmentFactsList";
        }
        redirectAttributes.addFlashAttribute("message", "Edit Failure");
        return "redirect:/editTreatmentFact/" + treatmentFact.getId();
    }

    @GetMapping("/deleteTreatmentFact/{id}")
    public String deleteTreatmentFact(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        if (treatmentFactService.deleteTreatmentFact(id)) {
            redirectAttributes.addFlashAttribute("message", "Delete Success");
        } else {
            redirectAttributes.addFlashAttribute("message", "Delete Failure");
        }
        return "redirect:/ViewTreatmentFactsList";
    }
    @GetMapping("/gettreatmentFactsByEmployeeId")
    public String getClientsByEmployeeId(@RequestParam(value = "employeeId", required = false) String employeeId, Model model) {
        List<TreatmentFact> treatmentFacts;
        if (employeeId != null) {
            // Получение фактов лечения для определенного сотрудника из сервиса
            treatmentFacts = treatmentFactService.getTreatmentFactsByEmployeeId(employeeId);
        } else {
            // Получение всех фактов лечения из сервиса
            treatmentFacts = treatmentFactService.getAllTreatmentFacts();
        }

        if (treatmentFacts != null) {
            // Если список фактов лечения успешно получен, добавляем сообщение об успешном выполнении
            model.addAttribute("message", "Get Success");
        } else {
            // Если список фактов лечения не получен (например, из-за ошибки), добавляем сообщение об ошибке
            model.addAttribute("message", "Get Failure");
        }

        // Помещаем полученные данные в модель для передачи на страницу ViewTreatmentFacts.jsp
        model.addAttribute("treatmentFacts", treatmentFacts);

        // Возвращаем имя представления ViewTreatmentFacts.jsp
        return "ViewTreatmentFactsList";
    }

}
