package otchetnost.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import otchetnost.model.User;

import java.util.List;

@Repository
public interface CreateUserRepository extends CrudRepository<User, Long> {
    User findById(int id);
    List<User> findByUsername(String username);
}
