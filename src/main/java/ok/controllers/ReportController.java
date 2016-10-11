package ok.controllers;

import ok.entity.Report;
import ok.service.ReportService;
import ok.service.SpeakerService;
import ok.validations.ReportValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by OKK on 21.09.2016.
 */
@Controller
public class ReportController {
    @Autowired
    private ReportService reportService;
    @Autowired
    private ReportValidator reportValidator;

    @Autowired
    private SpeakerService speakerService;
    @Autowired
    private transient MailSender mailTemplate;

    @Autowired
    private transient SimpleMailMessage simpleMailMessage;

    public void sendMessage(String mailTo, String message) {
        simpleMailMessage.setTo(mailTo);
        simpleMailMessage.setText(message);
        mailTemplate.send(simpleMailMessage);
    }

    @RequestMapping(value = "/report/new", method = RequestMethod.POST)
    public String addReport(@Valid Report report,
                            BindingResult bindingResult,
                            Principal principal, @RequestParam("title") String title, @RequestParam("annotation") String annotation, @RequestParam("presentation") MultipartFile multipartFile) {

        if(multipartFile.getSize()==0){
            bindingResult.rejectValue( "presentation","presentation.empty");
            return "redirect:/cabinet";}

        int speaker_id = Integer.valueOf(principal.getName());

        reportService.addOrEdit(title, annotation, multipartFile.getContentType(),  multipartFile, speaker_id);

        sendMessage(speakerService.findOne(speaker_id).getEmail(),
                "You have successfully submitted your report: "+title+".");

        return "redirect:/cabinet";
    }
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(Model model, @RequestParam String query) {
        if (query != null && !query.trim().equals("")) {
            List<Report> searchResults = reportService.fullTextSearch(query);
            model.addAttribute("searchResults", searchResults);
        } else {
            model.addAttribute("searchResults", new ArrayList<Report>());
        }
        return "views-base-searchResults";
    }
}
