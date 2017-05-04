package ok.controllers;

import ok.entity.Report;
import ok.entity.Speaker;
import ok.service.ReportService;
import ok.service.SpeakerService;
import ok.validations.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

/**
 * Created by OKK on 21.09.2016.
 */
@Controller
public class SpeakerController {
@Autowired
    private SpeakerService speakerService;
    @Autowired
    private UserValidator userValidator;
    @Autowired
    private ReportService reportService;

    @Autowired
    private transient MailSender mailTemplate;

    @Autowired
    private transient SimpleMailMessage simpleMailMessage;

    public void sendMessage(String mailTo, String message) {
        simpleMailMessage.setTo(mailTo);
        simpleMailMessage.setText(message);
        mailTemplate.send(simpleMailMessage);
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration (Model model){
        model.addAttribute("speaker", new Speaker());
        return "views-speaker-registration";
    }
    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration (@ModelAttribute Speaker speaker, BindingResult bindingResult){
        userValidator.validate(speaker, bindingResult);
        if(bindingResult.hasErrors()){
            return "views-speaker-registration";
        }else{
            BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
            speaker.setPassword(bCryptPasswordEncoder.encode((speaker.getPassword())));
            speakerService.addOrEdit(speaker);
        }
        sendMessage(speaker.getEmail(),
                "Congrats, " + speaker.getFirstName()+ " " + speaker.getSecondName() + ", you have successfully registrated on SciCon 2017");

        return "redirect:/";
    }

    @RequestMapping(value = "/admin-registration", method = RequestMethod.POST)
    public String adminRegistration (@ModelAttribute Speaker speaker, BindingResult bindingResult){
        userValidator.validate(speaker, bindingResult);
        if(bindingResult.hasErrors()){
            return "redirect:/admin/allSpeakers";
        }else{
            BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
            speaker.setPassword(bCryptPasswordEncoder.encode((speaker.getPassword())));
            speakerService.addOrEdit(speaker);
        }

        return "redirect:/admin/allSpeakers";
    }

    @RequestMapping(value = "/loginpage", method = RequestMethod.GET)
    public String login() {
        return "views-speaker-login";
    }

    @RequestMapping(value = "/cabinet", method = RequestMethod.GET)
    public String cabinet(Principal principal, Model model) {
        Speaker speaker = speakerService.findOne(Integer.parseInt(principal.getName()));
        model.addAttribute("speaker", speaker);
        model.addAttribute("spReports", reportService.findBySpeaker(speaker.getId()));
      //  model.addAttribute("report", new Report());
        return "views-speaker-cabinet";
    }

    @RequestMapping(value = "/download-report-{docId}" , method = RequestMethod.GET)
    public String downloadReport(@PathVariable int docId, HttpServletResponse response) throws IOException {
        Report report  = reportService.findOne(docId);
        response.setContentType(report.getType());
        response.setContentLength(report.getPresentation().length);
        String[] parts =  report.getType().split("/");
        String type = parts[1];
        response.setHeader("Content-Disposition","attachment; filename=\"" + report.getTitle()+"." + type +"\"");

        FileCopyUtils.copy(report.getPresentation(), response.getOutputStream());

        return "redirect:/cabinet";
    }

    @RequestMapping(value =  "/delete-report-{docId}" , method = RequestMethod.GET)
    public String deleteReport(@PathVariable int docId, Principal principal) {
        int speakerId = Integer.parseInt(principal.getName());
        Report report = reportService.findOne(docId);
        if (report.getSpeaker().getId()==speakerId){
        reportService.delete(docId);
        return "redirect:/cabinet";}
        else {
            return "views-base-403";
        }

    }
    @RequestMapping(value =  "/admin-delete-report-{docId}" , method = RequestMethod.GET)
    public String adminDeleteReport(@PathVariable int docId, SecurityContextHolderAwareRequestWrapper request) {
        boolean b = request.isUserInRole("ROLE_ADMIN");
        if (b) {
        reportService.delete(docId);
        return "redirect:/admin/allReports";
        }
        else {
            return "views-base-403";
        }
    }

    @RequestMapping(value =  "/admin-delete-speaker-report-{docId}" , method = RequestMethod.GET)
    public String adminDeleteSpeakerReport(@PathVariable int docId, SecurityContextHolderAwareRequestWrapper request) {
        boolean b = request.isUserInRole("ROLE_ADMIN");
        if (b) {
            reportService.delete(docId);
            return "redirect:/admin/allSpeakers";
        }
        else {
            return "views-base-403";
        }
    }

    @RequestMapping(value = "/speaker/edit", method = RequestMethod.GET)
    public String edit(Principal principal, Model model) {
        model.addAttribute("speaker", speakerService.findOne(Integer.parseInt(principal.getName())));
        return "views-speaker-edit";
    }

    @RequestMapping(value = "/speaker/edit", method = RequestMethod.POST)
    public String edit(Principal principal, @RequestParam("title")String title,@RequestParam("firstName")String firstName,@RequestParam("secondName")String secondName, @RequestParam("phone")String phone) {
        speakerService.addOrEdit(Integer.parseInt(principal.getName()), title, firstName, secondName, phone);
        return "redirect:/cabinet";
    }

    @RequestMapping(value =  "/cabinet/addReport" , method = RequestMethod.GET)
    public String addReport(Principal principal, Model model) {
        Speaker speaker = speakerService.findOne(Integer.parseInt(principal.getName()));
        model.addAttribute("speaker", speaker);

        Report report  = new Report();
        model.addAttribute("report", report);

        List<Report> reportList = reportService.findBySpeaker(speaker.getId());
        model.addAttribute("reportList", reportList);

        return "cabinet-add-report";
    }

    @RequestMapping(value = "/admin/allSpeakers", method = RequestMethod.GET)
    public String allReports(Model model) {
        List<Speaker> speakerList = speakerService.findAll();
        model.addAttribute("speakers", speakerList);
        model.addAttribute("speaker", new Speaker());
        return "views-admin-allSpeakers";
    }

    @RequestMapping(value =  "/admin-delete-speaker-{spId}" , method = RequestMethod.GET)
    public String deleteSpeaker(@PathVariable int spId, SecurityContextHolderAwareRequestWrapper request) {
        boolean b = request.isUserInRole("ROLE_ADMIN");
        if (b){
        speakerService.delete(spId);
        return "redirect:/admin/allSpeakers";}
        else {
            return "views-base-403";
        }
    }

    @RequestMapping(value = "/participants", method = RequestMethod.GET)
    public String allParticipants(Model model) {
        model.addAttribute("allParticipants", speakerService.allSpeakers());
        model.addAttribute("participantsNumber", speakerService.participantsNumber());
        return "views-speaker-participants";
    }


    @RequestMapping(value = "/participants-{page}-{proPage}", method = RequestMethod.GET)
    public String allParticipants(@PathVariable int page, @PathVariable int proPage, Model model) {
        model.addAttribute("allParticipants", speakerService.speakers(page, proPage));
        model.addAttribute("participantsNumber", speakerService.participantsNumber());
        return "views-speaker-participants";
    }

//    @RequestMapping(value =  "/delete/{userId}/{docId}" , method = RequestMethod.GET)
//    public String deleteReport(@PathVariable int speakerId, @PathVariable int reportId) {
//        reportService.delete(reportId);
//        return "redirect:/cabinet/"+speakerId;
//    }

//    @RequestMapping(value = { "/add-document-{userId}" }, method = RequestMethod.POST)
//    public String uploadDocument(@Valid FileBucket fileBucket, BindingResult result, ModelMap model, @PathVariable int userId) throws IOException{
//
//        if (result.hasErrors()) {
//            System.out.println("validation errors");
//            User user = userService.findById(userId);
//            model.addAttribute("user", user);
//
//            List<UserDocument> documents = userDocumentService.findAllByUserId(userId);
//            model.addAttribute("documents", documents);
//
//            return "managedocuments";
//        } else {
//
//            System.out.println("Fetching file");
//
//            User user = userService.findById(userId);
//            model.addAttribute("user", user);
//
//            saveDocument(fileBucket, user);
//
//            return "redirect:/add-document-"+userId;
//        }
//    }
//
//    private void saveDocument(FileBucket fileBucket, User user) throws IOException{
//
//        UserDocument document = new UserDocument();
//
//        MultipartFile multipartFile = fileBucket.getFile();
//
//        document.setName(multipartFile.getOriginalFilename());
//        document.setDescription(fileBucket.getDescription());
//        document.setType(multipartFile.getContentType());
//        document.setContent(multipartFile.getBytes());
//        document.setUser(user);
//        userDocumentService.saveDocument(document);
//    }
//    @RequestMapping (value = "/speaker/cabinet/{id}",method = RequestMethod.GET)
//    public String cabinet (@PathVariable String id, Model model){
//        Speaker speaker = speakerService.findOne(Integer.parseInt(id));
//        model.addAttribute("speaker", speaker);
//        model.addAttribute("spReports", reportService.findBySpeaker(Integer.parseInt(id)));
//        return "views-speaker-cabinet";
//    }
//
//    @RequestMapping(value =  "/download/{speakerId}/{reportId}" , method = RequestMethod.GET)
//    public String downloadReport(@PathVariable int speakerId, @PathVariable int reportId, HttpServletResponse response) throws IOException {
//        Report report = reportService.findOne(reportId);
//        response.setContentLength(report.getPresentation().length);
//        response.setHeader("Content-Disposition","attachment; filename=\"" + report.getTitle() +"\"");
//
//        FileCopyUtils.copy(report.getPresentation(), response.getOutputStream());
//
//        return "redirect:/cabinet/"+speakerId;
//    }





}