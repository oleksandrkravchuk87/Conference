package ok.repository;

import ok.entity.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */





public interface ReportRepo extends JpaRepository<Report, Integer> {
    @Query("SELECT r FROM Report r WHERE r.speaker.id = :id")
    List<Report> findBySpeaker (@Param("id") int id);

    @Query("SELECT r FROM Report r WHERE r.id = :id")
    Report findOne (@Param("id") int id);



}
