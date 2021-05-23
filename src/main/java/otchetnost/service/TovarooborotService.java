package otchetnost.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import otchetnost.model.Store;
import otchetnost.model.Tovarooborot;
import otchetnost.repository.TovarooborotRepository;

import java.util.List;

@Service
public class TovarooborotService{
    @Autowired
    private TovarooborotRepository tovarooborotRepository;

    @Transactional
    public List<Tovarooborot> loadTovarooborotbyDateTime(String datetime){
        return tovarooborotRepository.findByDatetime(datetime);
    }

    @Transactional
    public Iterable<Tovarooborot> loadAllTovarooborots(){
        return tovarooborotRepository.findAll();
    }

    @Transactional
    public Iterable<Tovarooborot> loadAllTovarooborotStore(int store){
        return tovarooborotRepository.findById(store);
    }

    @Transactional
    public Tovarooborot saveTovarooborots(Tovarooborot tovarooborot){
        return tovarooborotRepository.save(tovarooborot);
    }

    @Transactional
    public void deleteTovarooborots(Tovarooborot t){
        tovarooborotRepository.delete(t);
    }

    public void addStore(Tovarooborot tovarooborot, Store store){
        tovarooborot.getStores().add(store);
        tovarooborotRepository.save(tovarooborot);
    }
}
