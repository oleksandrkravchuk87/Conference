package ok.service.implementation;

import ok.entity.Report;
import ok.repository.ReportRepo;
import ok.repository.SpeakerRepo;
import ok.service.ReportService;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.IOException;
import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */
@Service
@Transactional
public class ReportServiceImpl implements ReportService {
    @Autowired
    private ReportRepo reportRepo;
    @Autowired
    private SpeakerRepo speakerRepo;



    @PersistenceContext
    EntityManager em;

    @Override
    public List<Report> fullTextSearch(String stringToMatch) {
        FullTextEntityManager ftem = org.hibernate.search.jpa.Search.getFullTextEntityManager(em);

        // build up a Lucene query
        QueryBuilder qb = ftem.getSearchFactory().buildQueryBuilder().forEntity(Report.class).get();
        org.apache.lucene.search.Query luceneQuery = qb
                .keyword()
                .onFields("title", "annotation")
                .matching(stringToMatch.toLowerCase())
                .createQuery();

        // wrap the Lucene query in a JPA query
        Query jpaWrappedQuery = ftem.createFullTextQuery(luceneQuery, Report.class);

        return jpaWrappedQuery.getResultList();
    }




    public void addOrEdit(Report report) {
        reportRepo.save(report);
    }

    public void addOrEdit(String title, String annotation, String type, MultipartFile multipartFile, int speaker_id) {
        Report report =new Report();
        report.setTitle(title);
        report.setAnnotation(annotation);
        report.setType(type);
        report.setSpeaker(speakerRepo.findOne(speaker_id));
        try {
            report.setPresentation(multipartFile.getBytes());
        } catch (IOException e){
            e.printStackTrace();
        }
        reportRepo.save(report);

    }

    public void delete(int id) {
reportRepo.delete(id);
    }

    public Report findOne(int id) {
        return reportRepo.findOne(id);
    }

    public List<Report> findAll() {
        return null;
    }

    public List<Report> findBySpeaker(int id) {
        return reportRepo.findBySpeaker(id);
    }
}
