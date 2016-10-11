package ok.controllers;

import ok.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by OKK on 21.09.2016.
 */
@Controller
public class AuthorController {
@Autowired
    private AuthorService authorService;


}
