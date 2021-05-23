package otchetnost.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import otchetnost.model.Store;
import otchetnost.model.Tovarooborot;
import otchetnost.service.StoreService;
import otchetnost.service.TovarooborotService;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/createtovarooborot")
//@PreAuthorize("hasAuthority('SPECIALIST')")
public class TovarooborotController {
    @Autowired
    private TovarooborotService tovarooborotService;
    @Autowired
    private StoreService storeService;
//таблица продукт добавить поле количество, при добавлении наполнения к количеству прибавлять наполнение
//попробовать вместо id поставить переменную string с названием города, создать метод поиска города по id
//попробовать вывести инфо через cout
    @GetMapping
    public String TovarooborotList(Map<String, Object> model) {
        Iterable<Store> stores = storeService.loadAllTovarStores();
        model.put("stores", stores);
        Iterable<Tovarooborot> tovarooborots = tovarooborotService.loadAllTovarooborots();
        model.put("tovarooborots", tovarooborots);

        return "createtovarooborot";
    }

    @PostMapping
    public String addTovarooborot(@RequestParam String volume, @RequestParam String assortment, @RequestParam String speed,
                           @RequestParam String rhythm, @RequestParam String datetime,
                           @RequestParam("choisestore") String choise,
                           Map<String, Object> model) {
        Iterable<Store> stores = storeService.loadAllTovarStores();
        Store store = new Store();
        for (Store t: stores) {
            if (t.getCity().equals(choise)){
                store = t;
            }
        }
        model.put("stores", stores);
        Tovarooborot tovarooborot = new Tovarooborot(volume, assortment, speed, rhythm, datetime, store, false);

        tovarooborotService.saveTovarooborots(tovarooborot);

        Iterable<Tovarooborot> tovarooborots = tovarooborotService.loadAllTovarooborots();
        model.put("tovarooborots", tovarooborots);
        Store store1 = storeService.loadCity(choise);
        tovarooborotService.addStore(tovarooborot, store1);

        return "createtovarooborot";
    }

    @PostMapping("/filter")
    public String filterTovarooborot(@RequestParam("filter") String filter, Map<String, Object> model) {
        Iterable<Tovarooborot> tovarooborots;
        if (filter != null && !filter.isEmpty()) {
            tovarooborots = tovarooborotService.loadTovarooborotbyDateTime(filter);
        } else {
            tovarooborots = tovarooborotService.loadAllTovarooborots();
        }

        model.put("tovarooborots", tovarooborots);

        return "createtovarooborot";
    }

    @PostMapping("deleteTovarooborot")
    public String deleteEvent(@RequestParam("tovarooborotId") Tovarooborot tovarooborot, Map<String, Object> model){
        tovarooborotService.deleteTovarooborots(tovarooborot);
        Iterable<Store> stores = storeService.loadAllTovarStores();
        model.put("stores", stores);
        Iterable<Tovarooborot> tovarooborots = tovarooborotService.loadAllTovarooborots();
        model.put("tovarooborots", tovarooborots);

        return "createtovarooborot";
    }
    @GetMapping("/{tovarooborot}")
    public String editTovarooborot(@PathVariable Tovarooborot tovarooborot, Model model) {
        model.addAttribute("tovarooborot", tovarooborot);
        return "workwithtovarooborot";
    }

    @PostMapping("/show")
    public String edit(@RequestParam String volume, @RequestParam String assortment, @RequestParam String speed,
                       @RequestParam String rhythm, @RequestParam String datetime,
                       @RequestParam("idtovar") Tovarooborot tovarooborot){

        tovarooborot.setVolume(volume);
        tovarooborot.setAssortment(assortment);
        tovarooborot.setSpeed(speed);
        tovarooborot.setRhythm(rhythm);
        tovarooborot.setDatetime(datetime);
        tovarooborotService.saveTovarooborots(tovarooborot);

        return "redirect:/createtovarooborot";
    }

    @GetMapping("/tovar/otchet")
    public void otchet(HttpServletResponse httpServletResponse) throws IOException {

        httpServletResponse.setContentType("application/octet-stream");

        String headerkey = "Content-Disposition";
        String headerValue = "attachement; filename=tovarooborot.xls";

        httpServletResponse.setHeader(headerkey, headerValue);
        List<Tovarooborot> list = (List<Tovarooborot>) tovarooborotService.loadAllTovarooborots();
        CreateOtchot createOtchot = new CreateOtchot(list);
        createOtchot.otchet(httpServletResponse);
    }
}
