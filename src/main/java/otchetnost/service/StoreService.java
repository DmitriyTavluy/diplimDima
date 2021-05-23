package otchetnost.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import otchetnost.model.Store;
import otchetnost.repository.StoreRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class StoreService {
    @Autowired
    private StoreRepository storeRepository;

    @Transactional
    public List<Store> loadStoreByAddress(String address) {

        return storeRepository.findByAddress(address);
    }

    @Transactional
    public Iterable<Store> loadAllTovarStores(){
        return storeRepository.findAll();
    }

    @Transactional
    public Iterable<Store> loadAllStores() {
        return storeRepository.findAll();
    }

    @Transactional
    public Store saveStores(Store store) {
        return storeRepository.save(store);
    }

    @Transactional
    public void deleteStore(Store store) {
        storeRepository.delete(store);
    }

    @Transactional
    public Store loadCity(String city){
        return storeRepository.findByCity(city);
    }

}
