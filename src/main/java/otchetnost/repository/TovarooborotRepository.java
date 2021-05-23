package otchetnost.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import otchetnost.model.Store;
import otchetnost.model.Tovarooborot;

import java.util.List;

@Repository
public interface TovarooborotRepository extends CrudRepository<Tovarooborot, Integer> {
    List<Tovarooborot> findByDatetime (String datetime);
    List<Tovarooborot> findById (int store);
}
