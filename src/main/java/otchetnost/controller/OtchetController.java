package otchetnost.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import otchetnost.model.Store;
import otchetnost.model.Tovarooborot;
import otchetnost.service.StoreService;
import otchetnost.service.TovarooborotService;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/createotchettovar")
public class OtchetController {

    @Autowired
    private TovarooborotService tovarooborotService;
    @Autowired
    private StoreService storeService;

    @GetMapping
    public String TovarooborotList(Map<String, Object> model) {
        Iterable<Store> stores = storeService.loadAllTovarStores();
        model.put("stores", stores);
        Iterable<Tovarooborot> tovarooborots = tovarooborotService.loadAllTovarooborots();
        model.put("tovarooborots", tovarooborots);

        return "createotchet";
    }

    @PostMapping("/final/create")
    public String finalOtcheet(@RequestParam("idtovar") Tovarooborot tovarooborot, Map<String, Object> model){
        tovarooborot.setCheckOtchet(true);
        tovarooborotService.saveTovarooborots(tovarooborot);

        Iterable<Tovarooborot> tovarooborots = tovarooborotService.loadAllTovarooborots();
        model.put("tovarooborots", tovarooborots);
        return "createotchet";
    }

    @PostMapping("/final/otmena")
    public String finalOtcheetOtmena(@RequestParam("idtovar") Tovarooborot tovarooborot, Map<String, Object> model){
        tovarooborot.setCheckOtchet(false);
        tovarooborotService.saveTovarooborots(tovarooborot);

        Iterable<Tovarooborot> tovarooborots = tovarooborotService.loadAllTovarooborots();
        model.put("tovarooborots", tovarooborots);
        return "createotchet";
    }
    @GetMapping("/final/save")
    public void finalSave(HttpServletResponse httpServletResponse) throws IOException {

        httpServletResponse.setContentType("application/octet-stream");

        String headerkey = "Content-Disposition";
        String headerValue = "attachement; filename=tovarooborot.xls";

        httpServletResponse.setHeader(headerkey, headerValue);
        List<Tovarooborot> list = (List<Tovarooborot>) tovarooborotService.loadAllTovarooborots();
        OtchetnostFinal createOtchot = new OtchetnostFinal(list);
        createOtchot.otchetFinal(httpServletResponse);

        for (Tovarooborot tovarooborot : list) {
            if (tovarooborot.isCheckOtchet()){
                tovarooborot.setCheckOtchet(false);
                tovarooborotService.saveTovarooborots(tovarooborot);
            }
        }
    }


}
