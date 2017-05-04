package ok.repository;

import ok.entity.Speaker;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */
public interface SpeakerRepo extends JpaRepository<Speaker, Integer> {
@Query("SELECT s FROM Speaker s WHERE s.email LIKE :login")
    Speaker findByLogin (@Param("login") String login);

    @Query("SELECT s FROM Speaker s WHERE s.id = :id")
    Speaker findOne (@Param("id") int id);

    @Query("FROM Speaker")
    List<Speaker> allSpeakers ();

    @Query("FROM Speaker")
    List<Speaker> speakers (Pageable pageable);

    @Query("SELECT COUNT(*) FROM Speaker")
    int participantsNumber();

}
