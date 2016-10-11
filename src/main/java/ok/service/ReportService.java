package ok.service;

import ok.entity.Report;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */
public interface ReportService {
    void addOrEdit (Report report);
    void addOrEdit (String title, String annotation, String type, MultipartFile multipartFile, int speaker_id);
    void delete (int id);
    Report findOne (int id);
    List<Report> findAll();
    List<Report> findBySpeaker(int id);
    List<Report> fullTextSearch(String stringToMatch);

}
