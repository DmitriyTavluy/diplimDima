package otchetnost.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import otchetnost.model.User;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    User findByUsername(String username);
    List<User> findByActive(boolean active);
    User findById(int id);
}
