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

    @RequestMapping(value = "/admin/adminpage", method = RequestMethod.GET)
    public String adminpage (){return "views-admin-adminpage";}

    @RequestMapping(value = "/calendar", method = RequestMethod.GET)
    public String Calendar (){return "views-base-calendar";}

    @RequestMapping(value = "/location", method = RequestMethod.GET)
    public String Location (){return "views-base-location";}
}
