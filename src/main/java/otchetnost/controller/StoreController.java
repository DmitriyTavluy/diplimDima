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

import java.util.Map;

@Controller
@RequestMapping("/createstore")
@PreAuthorize("hasAuthority('ADMIN')")
public class StoreController {
    @Autowired
    private StoreService storeService;
    @Autowired
    private TovarooborotService tovarooborotService;

    @GetMapping
    public String StoreList(Map<String, Object> model) {
        Iterable<Store> stores = storeService.loadAllStores();
        model.put("stores", stores);

        return "createstore";
    }
    @PostMapping
    public String addStore(@RequestParam String region, @RequestParam String city, @RequestParam String address,
                            Map<String, Object> model) {
        Store store = new Store(region, city, address);

        storeService.saveStores(store);

        Iterable<Store> stores = storeService.loadAllStores();
        model.put("stores", stores);

        return "createstore";
    }
    @PostMapping("/filter")
    public String filterStore(@RequestParam("filter") String filter, Map<String, Object> model) {
        Iterable<Store> stores;
        if (filter != null && !filter.isEmpty()) {
            stores = storeService.loadStoreByAddress(filter);
        } else {
            stores = storeService.loadAllStores();
        }

        model.put("stores", stores);

        return "createstore";
    }

    @PostMapping("deleteStore")
    public String deleteEvent(@RequestParam("storeId") Store store, Map<String, Object> model){

        Iterable<Tovarooborot> tovarooborots = tovarooborotService.loadAllTovarooborots();
        Tovarooborot tovarooborot = new Tovarooborot();
        for (Tovarooborot result : tovarooborots) {
            if (result.getId().getId().equals(store.getId())){
                tovarooborotService.deleteTovarooborots(result);
            }
        }
        storeService.deleteStore(store);
        Iterable<Store> stores = storeService.loadAllStores();
        model.put("stores", stores);
        return "createstore";
    }
    @GetMapping("/{store}")
    public String editStore(@PathVariable Store store, Model model) {
        model.addAttribute("store", store);
        return "workwithstore";
    }
    @PostMapping("/show")
    public String edit(@RequestParam String region, @RequestParam String city, @RequestParam String address,
                        @RequestParam("id") Store store){

        store.setRegion(region);
        store.setCity(city);
        store.setAddress(address);
        storeService.saveStores(store);

        return "redirect:/createstore";
    }


}
