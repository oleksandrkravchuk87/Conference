package ok.repository;

import ok.entity.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by OKK on 20.09.2016.
 */
public interface TagRepo extends JpaRepository<Tag, Integer> {
}
