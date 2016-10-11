package ok.service;

import ok.entity.Author;

import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */
public interface AuthorService {
    void addOrEdit (Author author);
    void addOrEdit ( String title, String firstName, String secondName);
    void delete (int id);
    Author findOne (int id);
    List<Author> findAll();
}
