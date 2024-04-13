package com.example.jspdemo.controller;

import com.example.jspdemo.model.Client;
import com.example.jspdemo.service.ClientService;
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
public class ClientController {
    @Autowired
    ClientService clientService;

    @GetMapping({"/viewClientList"})
    public String viewClientList(@ModelAttribute("message")String message, Model model){
        getClientsByFio("", model);
        model.addAttribute("clientList",clientService.getAllClients());
        model.addAttribute("message", message);
        return "ViewClientList";
    }
    @GetMapping({"/AddClient"})
    public String AddClient(@ModelAttribute("message") String message,Model model){
        model.addAttribute("client",new Client());
        model.addAttribute("message",message);
        return "AddClient";
    }

    @PostMapping("/saveClient")
    public String saveClient(Client client, RedirectAttributes redirectAttributes){
        if (clientService.saveOrUpdateClient(client)){
            redirectAttributes.addFlashAttribute("message", "Save Success");
            return "redirect:/viewClientList";
        }
        redirectAttributes.addFlashAttribute("message","Save Failure");
        return "redirect:/AddClient";
    }

    @GetMapping("/editClient/{id}")
    public String editClient(@PathVariable Long id, Model model){
    model.addAttribute("client",clientService.getClientById(id));
    return "EditClient";
    }
    @PostMapping("/editSaveClient")
    public String editSaveClient(Client client, RedirectAttributes redirectAttributes) {
        if (clientService.saveOrUpdateClient(client)) {
            redirectAttributes.addFlashAttribute("message", "Edit Success");
            return "redirect:/viewClientList";
        }

        redirectAttributes.addFlashAttribute("message", "Edit Failure");
        return "redirect:/editClient/" + client.getId();
    }
    @GetMapping("/deleteClient/{id}")
    public String deleteClient(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        if (clientService.deleteClient(id)) {
            redirectAttributes.addFlashAttribute("message", "Delete Success");
        } else {
            redirectAttributes.addFlashAttribute("message", "Delete Failure");
        }

        return "redirect:/viewClientList";
    }
    @GetMapping("/layout")
    public String showLayoutPage() {
        return "layout";
    }
    @GetMapping({"/","/main"})
    public String showMainPage() {
        return "main";
    }
    @GetMapping("/getClientsByFio")
    public String getClientsByFio(@RequestParam(value = "fio", required = false) String fio, Model model) {
        List<Client> clients;
        if (fio != null && !fio.isEmpty()) {
            // Получение клиентов с указанным номером паспорта из сервиса
            clients = clientService.getClientsByFio(fio);
        } else {
            // Получение всех клиентов из сервиса
            clients = clientService.getAllClients();
        }

        if (clients != null) {
            // Если список клиентов успешно получен, добавляем сообщение об успешном выполнении
            model.addAttribute("message", "Get Success");
        } else {
            // Если список клиентов не получен (например, из-за ошибки), добавляем сообщение об ошибке
            model.addAttribute("message", "Get Failure");
        }

        // Помещаем полученные данные в модель для передачи на страницу ViewClientList.jsp
        model.addAttribute("clients", clients);

        // Возвращаем имя представления ViewClientList.jsp
        return "ViewClientList";
    }


}
