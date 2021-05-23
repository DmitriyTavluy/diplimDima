package otchetnost.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import otchetnost.model.Store;

import java.util.List;

@Repository
public interface StoreRepository extends CrudRepository<Store, Long> {
    List<Store> findByAddress(String address);
    List<Store> findById(int id);
    Store findByCity(String city);
}
