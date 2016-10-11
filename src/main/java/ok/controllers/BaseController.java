package ok.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by OKK on 21.09.2016.
 */
@Controller
public class BaseController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String Home (){return "views-base-home";}
}
