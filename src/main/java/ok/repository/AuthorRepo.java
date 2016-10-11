package ok.repository;

import ok.entity.Author;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by OKK on 20.09.2016.
 */
public interface AuthorRepo extends JpaRepository<Author, Integer> {
}
