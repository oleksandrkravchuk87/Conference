package ok.service.implementation;

import ok.entity.Author;
import ok.repository.AuthorRepo;
import ok.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */
@Service
public class AuthorServiceImpl implements AuthorService {
    @Autowired
    private AuthorRepo authorRepo;


    public void addOrEdit(Author author) {
        authorRepo.save(author);
    }

    public void addOrEdit(String title, String firstName, String secondName) {
Author author =new Author();
        author.setTitle(title);
        author.setFirstName(firstName);
        author.setSecondName(secondName);
   authorRepo.save(author);
    }

    public void delete(int id) {
        authorRepo.delete(id);
    }

    public Author findOne(int id) {
        return authorRepo.findOne(id);
    }

    public List<Author> findAll() {
        return authorRepo.findAll();
    }
}
